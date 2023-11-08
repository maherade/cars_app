import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/presentation/screens/open_full_product.dart';
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
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_){
           return OpenFullProduct(
             productPrice: '${cubit.favoriteProducts!.mainProducts![index].wholePrice}',
             productCode: '${cubit.favoriteProducts!.mainProducts![index].productModelGuide}',
             productImage: '${cubit.favoriteProducts!.mainProducts![index].imgUrl}',
             quantity: cubit.favoriteProducts!.mainProducts![index].quantity,
             productTitle: '${CashHelper.getData(
                 key: CashHelper.languageKey)
                 .toString() ==
                 "ar"?cubit.favoriteProducts!.mainProducts![index].productName:cubit.favoriteProducts!.mainProducts![index].latinName}',
           );
        }));
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(8),

        child: Container(
            width: MediaQuery.sizeOf(context).width * .5,
            decoration: BoxDecoration(
              color: Colors.white,
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
                // Align(
                //   alignment: CashHelper.getData(
                //       key: CashHelper.languageKey)
                //       .toString() ==
                //       "ar"? Alignment.topLeft:Alignment.topRight,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.grey.shade100,
                //       borderRadius: BorderRadius.circular(40)
                //     ),
                //     child: IconButton(
                //         onPressed: () {
                //           AppCubit.get(context).allFavorite.clear();
                //           AppCubit.get(context).insertDatabase(
                //               name:
                //               '${CashHelper.getData(
                //                   key: CashHelper.languageKey)
                //                   .toString() ==
                //                   "ar"?cubit.favoriteProducts!.mainProducts![index].productName:cubit.favoriteProducts!.mainProducts![index].latinName}',
                //               code:'${cubit.favoriteProducts!.mainProducts![index].productModelGuide}',
                //               price: '${cubit.favoriteProducts!.mainProducts![index].wholePrice}',
                //               number: cubit.productsFavoritesControllers[index].text==''?'1':cubit.productsFavoritesControllers[index].text,
                //               image: '${AppCubit.get(context).newSellProducts![index].imgUrl}',
                //               context: context).then((value) {
                //             customToast(color: ColorManager.darkGrey,title: AppLocalizations.of(context)!.translate('addedToCart').toString());
                //           }).then((value) {
                //             cubit.increaseCounter();
                //             cubit.productsFavoritesControllers[index].clear();
                //           });
                //         },
                //         icon: const Icon(
                //           Icons.add,
                //           size: 25,
                //           color: ColorManager.primaryColor,
                //         )),
                //   ),
                // ),
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
                  left: MediaQuery.sizeOf(context).width*.00005,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).height*.07,
                      height: MediaQuery.sizeOf(context).height*.05,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                            '${cubit.favoriteProducts!.mainProducts![index].wholePrice}\$',
                            style: GoogleFonts.cairo(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ),


              ],
            )),
      ),
    );
  }
}
