import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/localization_cubit/app_localization.dart';
import 'package:cars_app/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/color_manager.dart';
import '../utiles/local/cash_helper.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key,required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit=AppCubit.get(context);
    return Container(
      padding: const EdgeInsets.all(5),
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
            Align(
              alignment: CashHelper.getData(
                  key: CashHelper.languageKey)
                  .toString() ==
                  "ar"? Alignment.topRight:Alignment.topLeft,
              child: CachedNetworkImage(
                imageUrl:'${AppCubit.get(context).favoriteProducts!.mainProducts![index].imgUrl}',
                height: 70,
                width: 70,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>  Center(
                  child: Image.asset('assets/images/logo2.png',),
                ),
              ),
            ),
            Align(
              alignment: CashHelper.getData(
                  key: CashHelper.languageKey)
                  .toString() ==
                  "ar"? Alignment.topLeft:Alignment.topRight,
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
                          '${CashHelper.getData(
                              key: CashHelper.languageKey)
                              .toString() ==
                              "ar"?cubit.favoriteProducts!.mainProducts![index].productName:cubit.favoriteProducts!.mainProducts![index].latinName}',
                          code:'${cubit.favoriteProducts!.mainProducts![index].productModelGuide}',
                          price: '${cubit.favoriteProducts!.mainProducts![index].wholePrice}\$',
                          number: cubit.productsFavoritesControllers[index].text==''?'1':cubit.productsFavoritesControllers[index].text,
                          image: '${AppCubit.get(context).newSellProducts![index].imgUrl}',
                          context: context).then((value) {
                        customToast(color: ColorManager.darkGrey,title: AppLocalizations.of(context)!.translate('addedToCart').toString());
                      }).then((value) {
                        cubit.increaseCounter();
                        cubit.productsFavoritesControllers[index].clear();
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
                    '${CashHelper.getData(
                        key: CashHelper.languageKey)
                        .toString() ==
                        "ar"?cubit.favoriteProducts!.mainProducts![index].productName:cubit.favoriteProducts!.mainProducts![index].latinName}',
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
                  const Spacer(),
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
