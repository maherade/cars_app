import 'dart:math';

import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/color_manager.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key,required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit=AppCubit.get(context);
    return Container(
      padding: EdgeInsets.all(5),
        width: MediaQuery.sizeOf(context).width * .5,
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
            Positioned(
              left: 10,
              child: Image(
                image: AssetImage(
                    'assets/images/logo1.PNG'),
                height: 70,
                width: 70,
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height*.05,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(40)
                ),
                child: IconButton(
                    onPressed: () {
                      AppCubit.get(context).allFavorite.clear();
                      AppCubit.get(context).insertDatabase(
                          name:
                          '${cubit.favoriteProducts!.mainProducts![index].productName}',
                          code: cubit.favoriteProducts!.mainProducts![index].barcode ==null?'F0010-23250':'${cubit.favoriteProducts!.mainProducts![index].barcode}',
                          price: '${cubit.favoriteProducts!.mainProducts![index].wholePrice}\$',
                          number: cubit.productsFavoritesControllers[index].text==''?'1':cubit.productsFavoritesControllers[index].text,
                          image:
                          cubit.partNames.elementAt(Random().nextInt(cubit.partNames.length)),
                          context: context).then((value) {
                        customToast(color: ColorManager.darkGrey,title: 'تم اضافه المنتج في السله');
                      }).then((value) {
                        cubit.increaseCounter();
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 25,
                      color: ColorManager.primaryColor,
                    )),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height*.12,
              left:MediaQuery.sizeOf(context).width*.008 ,
              right:MediaQuery.sizeOf(context).width*.008 ,
              child: Align(
                alignment: Alignment.centerRight,

                child: Text(
                    '${cubit.favoriteProducts!.mainProducts![index].productName}',
                    style: GoogleFonts.cairo(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.black,
                    )),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height*.2,
              left:MediaQuery.sizeOf(context).width*.02 ,
              right:MediaQuery.sizeOf(context).width*.008 ,
              child: Row(
                children: [

                  Container(
                    height: 50,
                    width: 50,
                    child: TextFormField(
                      decoration:  const InputDecoration(

                        hintStyle: TextStyle(
                          fontSize: 20,
                        ),
                        hintText: '0',

                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                      controller: AppCubit.get(context)
                          .productsFavoritesControllers[index],
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                        '${cubit.favoriteProducts!.mainProducts![index].wholePrice}\$',
                        style: GoogleFonts.cairo(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.black,
                        )),
                  ),
                ],
              ),
            ),


          ],
        ));
  }
}
