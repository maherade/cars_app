import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/localization_cubit/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/color_manager.dart';

class CustomBottomSheet extends StatelessWidget {
  String content;
   CustomBottomSheet({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height*.08,
      width: MediaQuery.sizeOf(context).width*.2,
      decoration:  const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: MediaQuery.of(context).size.height*.02,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Text(
          '${AppLocalizations.of(context)!.translate('total').toString()} :${AppCubit.get(context).totalPrice}\$',
          style: GoogleFonts.cairo(
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
        ),
      ),

    );
  }
}
