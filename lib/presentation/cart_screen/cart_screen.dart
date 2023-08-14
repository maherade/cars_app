import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/app_cubit/app_cubit.dart';
import '../../business_logic/app_cubit/app_states.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.lightColor,
          appBar: AppBar(
            titleSpacing: 0.0,
            iconTheme: const IconThemeData(color: ColorManager.textColor),
            backgroundColor: ColorManager.primaryColor,
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorManager.lightColor,
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorManager.lightColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'العربة',
              style: GoogleFonts.cairo(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: ColorManager.lightColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                CartItem(),
              ],
            ),
          ),
        );
      },
    );
  }
}
