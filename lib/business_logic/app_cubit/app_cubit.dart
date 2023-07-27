import 'package:bloc/bloc.dart';
import 'package:cars_app/data/modles/user_model.dart';
import 'package:cars_app/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../styles/color_manager.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Future<void> userRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    try {
      emit(SignUpLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
        uId: credential.user?.uid ?? "",
        userName: name,
        email: email,
        phoneNumber: phone,
      );

      await addUserToFireStore(userModel).then((value) {
        emit(SignUpSuccessState());
        saveUser(
            name: name, email: email, phoneNumber: phone, id: userModel.uId!);
        getUser(id: userModel.uId!);
        print(userModel.uId!);
        customToast(
          title: 'Account Created Successfully',
          color: ColorManager.primaryColor,
        );
        print("--------------Account Created");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "weakPassword") {
      } else if (e.code == "Email in Use") {
        emit(SignUpErrorState(e.toString()));
        customToast(
          title: 'This account already exists',
          color: ColorManager.red,
        );
        print("--------------Failed To Create Account");
      }
    }
  }

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      getUser(id: value.user!.uid);
      debugPrint(value.user!.uid);

      customToast(
        title: 'Successfully Login',
        color: ColorManager.primaryColor,
      );
      debugPrint('User Login Success');
      emit(LoginSuccessState());
    }).catchError((error) {
      debugPrint('Error in userRegister is ${error.toString()}');
      emit(LoginErrorState(error.toString()));
    });
  }

  Future<void> saveUser({
    required String name,
    required String email,
    required String phoneNumber,
    required String id,
  }) async {
    emit(SaveUserLoadingState());

    UserModel userModel = UserModel(
      userName: name,
      phoneNumber: phoneNumber,
      email: email,
      uId: id,
    );

    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel.uId)
        .set(userModel.toJson())
        .then((value) {
      debugPrint('Save User Success');
      emit(SaveUserSuccessState());
    }).catchError((error) {
      debugPrint('Error in userRegister is ${error.toString()}');
      emit(SaveUserErrorState(error.toString()));
    });
  }

  Future<void> getUser({
    required String id,
  }) async {
    emit(GetUserLoadingState());

    FirebaseFirestore.instance.collection('Users').doc(id).get().then((value) {
      UserModel.fromJson(value.data()!);

      debugPrint('get User Success');

      emit(GetUserSuccessState());
    }).catchError((error) {
      debugPrint('Error in getUser is ${error.toString()}');
      emit(GetUserErrorState());
    });
  }

// User Reference

  CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  Future<void> addUserToFireStore(UserModel userModel) {
    return getUsersCollection().doc(userModel.uId).set(userModel);
  }

  Future<UserModel?> readUserFromFireStore(String id) async {
    DocumentSnapshot<UserModel> user = await getUsersCollection().doc(id).get();
    var myUser = user.data();
    return myUser;
  }
}
