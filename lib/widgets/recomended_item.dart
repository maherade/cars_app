import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/color_manager.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
        width: MediaQuery.sizeOf(context).width * .5,
        height: MediaQuery.sizeOf(context).height * .6,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x3600000F),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Image(
              image: const NetworkImage(
                  'https://macknmall.com/media/codazon_cache/brand/250x/wysiwyg/Bosch-1.png'),
              height: MediaQuery.sizeOf(context).height * .1,
              width: MediaQuery.sizeOf(context).width * .8,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height*.11,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(40)
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 25,
                      color: ColorManager.primaryColor,
                    )),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height*.16,
              left:MediaQuery.sizeOf(context).width*.008 ,
              right:MediaQuery.sizeOf(context).width*.008 ,
              child: Align(
                alignment: Alignment.centerRight,

                child: Text(
                    '''جاملغ بدون زرف نيسان فيرسا 2015-2019 سه كن ماليزيا''',
                    style: GoogleFonts.cairo(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.black,
                    )),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height*.22,
              left:MediaQuery.sizeOf(context).width*.02 ,
              right:MediaQuery.sizeOf(context).width*.008 ,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                    '22\$',
                    style: GoogleFonts.cairo(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.black,
                    )),
              ),
            ),


          ],
        ));
  }
}
