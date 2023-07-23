import 'package:bloc/bloc.dart';
import 'package:cars_app/business_logic/cars_cubit/cars_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarsCubit extends Cubit<CarsStates>{
  CarsCubit(super.initialState);

  static CarsCubit get(context) => BlocProvider.of(context);



}