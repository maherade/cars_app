import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../business_logic/app_cubit/app_cubit.dart';
import '../presentation/screens/car_name/car_name.dart';
import '../styles/color_manager.dart';

class BrandItem extends StatelessWidget {
  int index;
   BrandItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return  CarName(brandName:  AppCubit.get(context).brandNames[index],);
        }));
      },
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.1,
            width: MediaQuery.of(context).size.height*.1,
            decoration: BoxDecoration(
                border: Border.all(
                    color: ColorManager.primaryColor
                ),
                borderRadius: BorderRadius.circular(50)
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image:  AssetImage(
                AppCubit.get(context).brandImages[index],
              ),
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height*.05,
              width: MediaQuery.of(context).size.height*.05,
            ),
          ),
          Text(
            AppCubit.get(context).brandNames[index],
            style: GoogleFonts.cairo(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: ColorManager.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
