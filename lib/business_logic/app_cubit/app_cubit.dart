import 'package:bloc/bloc.dart';
import 'package:cars_app/constants/firebase_errors.dart';
import 'package:cars_app/data/modles/user_model.dart';
import 'package:cars_app/presentation/brand_screen/brand_screen.dart';
import 'package:cars_app/presentation/buy_screen/buy_screen.dart';
import 'package:cars_app/presentation/cart_screen/cart_screen.dart';
import 'package:cars_app/presentation/cash_screen/cash_screen.dart';
import 'package:cars_app/presentation/screens/home_screen/home_screen.dart';
import 'package:cars_app/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../presentation/setting_screen/setting_screen.dart';
import '../../styles/color_manager.dart';
import '../../utiles/local/cash_helper.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screenName = [
    const HomeScreen(),
    const BrandScreen(),
    const CartScreen(),
    const BuyScreen(),
    const CashScreen(),
    const SettingScreen()
  ];

  List<String> brandNames = [
    'تويوتا',
    'فولكس واجن',
    'ميتسوبيشي',
    'فورد',
    'شنجان',
    'نيسان',
    'BMW',
    'مرسيدس',
    'أودي',
    'شيري',
    'هفال',
    'شيفروليه',
    'سوزوكي',
    'مازدا',
  ];

  List<String> brandImages = [
    'assets/images/toyota.png',
    'assets/images/wol.png',
    'assets/images/mits.png',
    'assets/images/ford.png',
    'assets/images/chan.png',
    'assets/images/nissan.png',
    'assets/images/bmw.png',
    'assets/images/mercedes.png',
    'assets/images/audi.png',
    'assets/images/cher.png',
    'assets/images/hav.png',
    'assets/images/chef.png',
    'assets/images/suz.png',
    'assets/images/mazda.png',
  ];

  List<String> screenTitles = [
    'الرئيسيه',
    'الماركات',
    'هويه التسوق',
    'يشتري',
    'ايصال',
    'الاعدادات'
  ];

  List<String> carouselImage = [
    'https://img.freepik.com/free-photo/blue-sport-sedan-parked-yard_114579-5078.jpg?w=740&t=st=1690366458~exp=1690367058~hmac=6bb66f317c3048bf10b946728971b83c1ebd719a3835d430290b62fe99c55f58',
    'https://img.freepik.com/free-photo/grey-metallic-jeep-with-blue-stripe-it_114579-4080.jpg?w=740&t=st=1690366481~exp=1690367081~hmac=25db38645981f4e16bdc18d360e1da99c1bc11053ce34444915f6fee7452f1d3',
    'https://img.freepik.com/free-photo/black-cabriolet-parked-port_114579-5232.jpg?w=740&t=st=1690366493~exp=1690367093~hmac=e60800627925a51353e8ac0d736ab2db1d02370d948866e2f0086a0541898f44',
  ];

  void setIndex(int value) {
    currentIndex = value;
    emit(SetCurrentIndexStates());
  }


  Future<void> toPrivacy() async {
    String url =
        "https://www.freeprivacypolicy.com/live/fe2eb687-ce50-4a3e-89f6-dc489e763af1";
    await launch(url, forceSafariVC: false);
    emit(LaunchState());
  }
  void createAccountWithFirebaseAuth(
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
      UserModel user = UserModel(
        uId: credential.user?.uid ?? "",
        userName: name,
        email: email,
        phoneNumber: phone,
      );
      await addUserToFireStore(user).then((value) {
        emit(SignUpSuccessState());
        CashHelper.saveData(key: 'isUid', value: credential.user?.uid);
        customToast(
          title: 'Account Created Successfully',
          color: ColorManager.blue,

        );
        getUser(id: (credential.user?.uid)!);
        print("--------------Account Created");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
      } else if (e.code == FirebaseErrors.emailInUse) {
        emit(SignUpErrorState(e.toString()));
        customToast(
          title: 'This account already exists',
          color: ColorManager.red,
        );
        print("--------------Failed To Create Account");
      }
    }
  }

  Future<void> loginWithFirebaseAuth(
      {required String email, required String password}) async {
    try {
      emit(LoginLoadingState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel? user = await readUserFromFireStore(credential.user?.uid ?? "");
      if (user == null) {
        return customToast(
            title: '''This account doesn't exists''' , color: Colors.red.shade700);
      }
      if (user != null) {
        CashHelper.saveData(key: 'isUid', value: credential.user?.uid);
        emit(LoginSuccessState());
        await getUser(id: (credential.user?.uid)!);
        print(CashHelper.getData(key: 'isUid'));
        print("-----------Login Successfully");
        return;
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(e.toString()));
      print("-----------Login Failed");

      customToast(title: 'Invalid email or password', color: ColorManager.red);
    } catch (e) {
      customToast(title: 'Something went wrong $e', color: ColorManager.red);
    }
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

  UserModel? userModel;

  Future<void> getUser({required String id}) async {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('Users').doc(id).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      print(userModel!.userName);
      print('here');
      emit(GetUserSuccessState());
    }).catchError((error) {
      print(error);
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

  Future<void> deleteUser({
    required String id,
    required context,
  }) async {
    emit(DeleteUserLoadingState());

    FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .delete()
        .then((value) {
      customToast(title: "تم حذف حسابك بنجاح", color: Colors.red.shade700);
      getUser(id: id);

      debugPrint('Account Deleted Successfully');

      emit(DeleteUserSuccessState());
    }).catchError((error) {
      debugPrint('Error in DeleteUser is ${error.toString()}');
      emit(DeleteUserErrorState());
    });
  }
}
