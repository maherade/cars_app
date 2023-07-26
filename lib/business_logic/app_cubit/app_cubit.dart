import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit(super.initialState);

  static AppCubit get(context) => BlocProvider.of(context);



}