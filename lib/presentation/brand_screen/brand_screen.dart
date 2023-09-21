import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/widgets/brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/app_cubit/app_cubit.dart';
import '../../styles/color_manager.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      builder:(context, state) {
        var cubit=AppCubit.get(context);

        return Scaffold(
          backgroundColor: ColorManager.lightColor,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorManager.textColor),
            backgroundColor: ColorManager.primaryColor,
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorManager.lightColor,
            ),
            title: Text(
              'الماركات',
              style: GoogleFonts.cairo(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: ColorManager.lightColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 6 / 7,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return BrandItem(index: index);
                    },
                    itemCount: AppCubit.get(context).brandNames.length,
                  ),
                ),

              ],
            ),
          ),
        );
      },
      listener:(context, state) {

      },
    );
  }
}
