import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyWidget extends StatelessWidget {
  int index;
  CompanyWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*.1,
          width: MediaQuery.of(context).size.height*.1,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black
              ),
              borderRadius: BorderRadius.circular(50)
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image(
            image:  NetworkImage(
              AppCubit.get(context).companyImages[index],
            ),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height*.05,
            width: MediaQuery.of(context).size.height*.05,
          ),
        ),
        Text(
          AppCubit.get(context).companyNames[index],
          style: GoogleFonts.cairo(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: ColorManager.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
