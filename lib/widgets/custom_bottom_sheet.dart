import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/color_manager.dart';

class CustomBottomSheet extends StatelessWidget {
  String content;
   CustomBottomSheet({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height*.2,
      width: MediaQuery.sizeOf(context).width*.2,
      decoration:  const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Center(
        child: Text(
          content,
          style: GoogleFonts.cairo(
            color: ColorManager.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),

        ),
      ),
    );
  }
}
