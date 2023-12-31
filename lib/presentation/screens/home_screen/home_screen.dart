import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/presentation/screens/car_name/car_name.dart';
import 'package:cars_app/presentation/screens/open_full_product.dart';
import 'package:cars_app/presentation/screens/search_screen/search_screen.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/widgets/recomended_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business_logic/localization_cubit/app_localization.dart';
import '../../../utiles/local/cash_helper.dart';
import '../../../widgets/brand_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: ColorManager.textColor),
          backgroundColor: ColorManager.primaryColor,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: ColorManager.lightColor,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(
                  'assets/images/logo4.png',
                ),
                fit: BoxFit.fill,
                height: 80,
                width: 80,

              ),
              const SizedBox(width: 4,),
              Text('Nissan Group',
                  style: GoogleFonts.cairo(
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .height * .0255,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ))
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ));
              },
              child:  const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: BlocConsumer<AppCubit, AppStates>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CarouselSlider(
                    items: AppCubit.get(context).carouselImage.map((e) {
                      return Image(
                        image: AssetImage(e),
                        width: double.infinity,
                        fit: BoxFit.fill,
                      );
                    }).toList(),
                    options: CarouselOptions(
                        height: MediaQuery.sizeOf(context).height * .25,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        viewportFraction: 1,
                        scrollDirection: Axis.horizontal,
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .14,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return  const CarName(
                                  brandName: '', brandNameString: '',
                                );
                              }));
                            },
                            child: BrandItem(index: index),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 15,
                          );
                        },
                        itemCount: AppCubit.get(context).companyNames.length),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        AppLocalizations.of(context)!
                            .translate('recommended')
                            .toString(),
                        style: GoogleFonts.cairo(
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * .023,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.black,
                        )),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  // المنتج الموصي بيه
                  AppCubit
                      .get(context)
                      .favoriteProducts!
                      .mainProducts!
                      .isEmpty
                      ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.textColor,
                    ),
                  )
                      : SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .28,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return RecommendedItem(
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemCount:
                        AppCubit
                            .get(context)
                            .newSellProducts!
                            .length,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        AppLocalizations.of(context)!
                            .translate('newProducts')
                            .toString(),
                        style: GoogleFonts.cairo(
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * .023,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.black,
                        )),
                  ),

                  // احدث المنتجات
                  AppCubit.get(context)
                          .favoriteProducts!
                          .mainProducts!
                          .isNotEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * .28,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (_){
                                      return OpenFullProduct(
                                        productPrice: '${AppCubit.get(context).newSellProducts![index].wholePrice}',
                                        productCode: '${AppCubit.get(context).newSellProducts![index].productModelGuide}',
                                        productImage: '${AppCubit.get(context).newSellProducts![index].imgUrl}',
                                        quantity: AppCubit.get(context).newSellProducts![index].quantity,

                                        productTitle: '${CashHelper.getData(
                                            key: CashHelper.languageKey)
                                            .toString() ==
                                            "ar"?AppCubit.get(context).newSellProducts![index].productName:AppCubit.get(context).newSellProducts![index].latinName}',
                                      );
                                    }));

                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width:
                                          MediaQuery.sizeOf(context).width * .5,
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
                                              imageUrl:
                                                  '${AppCubit.get(context).newSellProducts![index].imgUrl}',
                                              placeholder: (context, url) =>
                                                  const Center(
                                                child: CircularProgressIndicator(
                                                  color: ColorManager.red,
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) => Center(
                                                child: Image.asset(
                                                  'assets/images/logo2.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              height: 70,
                                              width: 70,
                                            ),
                                          ),
                                          // Align(
                                          //   alignment: CashHelper.getData(
                                          //       key: CashHelper.languageKey)
                                          //       .toString() ==
                                          //       "ar"? Alignment.topLeft:Alignment.topRight,
                                          //   child: Container(
                                          //     decoration: BoxDecoration(
                                          //         color: Colors.grey.shade100,
                                          //         borderRadius:
                                          //             BorderRadius.circular(40)),
                                          //     child: IconButton(
                                          //         onPressed: () {
                                          //           AppCubit.get(context)
                                          //               .allFavorite
                                          //               .clear();
                                          //           AppCubit.get(context)
                                          //               .insertDatabase(
                                          //                   name:
                                          //                   '${CashHelper.getData(
                                          //                       key: CashHelper.languageKey)
                                          //                       .toString() ==
                                          //                       "ar"? AppCubit.get(context).newSellProducts![index].productName:AppCubit.get(context).newSellProducts![index].latinName}',
                                          //                   code:
                                          //                       '${AppCubit.get(context).newSellProducts![index].productModelGuide}',
                                          //                   price:
                                          //                       '${AppCubit.get(context).newSellProducts![index].wholePrice}',
                                          //                   number: AppCubit.get(
                                          //                                   context)
                                          //                               .productsNewSellControllers[
                                          //                                   index]
                                          //                               .text ==
                                          //                           ''
                                          //                       ? '1'
                                          //                       : AppCubit.get(
                                          //                               context)
                                          //                           .productsNewSellControllers[
                                          //                               index]
                                          //                           .text,
                                          //                   image:
                                          //                       '${AppCubit.get(context).newSellProducts![index].imgUrl}',
                                          //                   context: context)
                                          //               .then((value) {
                                          //             customToast(
                                          //                 color: ColorManager
                                          //                     .red,
                                          //                 title:
                                          //                 AppLocalizations
                                          //                     .of(context)!
                                          //                     .translate(
                                          //                     'addedToCart')
                                          //                     .toString());
                                          //           }).then((value) {
                                          //             AppCubit.get(context)
                                          //                 .increaseCounter();
                                          //             AppCubit.get(context).productsNewSellControllers[index].clear();
                                          //           });
                                          //         },
                                          //         icon: const Icon(
                                          //           Icons.add,
                                          //           size: 25,
                                          //           color:
                                          //               ColorManager.primaryColor,
                                          //         )),
                                          //   ),
                                          // ),
                                          Positioned(
                                            top: MediaQuery.sizeOf(context)
                                                    .height *
                                                .12,
                                            left:
                                                MediaQuery.sizeOf(context).width *
                                                    .008,
                                            right:
                                                MediaQuery.sizeOf(context).width *
                                                    .008,
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                  '${CashHelper.getData(
                                                      key: CashHelper.languageKey)
                                                      .toString() ==
                                                      "ar"? AppCubit.get(context).newSellProducts![index].productName:AppCubit.get(context).newSellProducts![index].latinName}',
                                                  style: GoogleFonts.cairo(
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: ColorManager.black,
                                                  )),
                                            ),
                                          ),
                                          Positioned(
                                            top: MediaQuery.sizeOf(context).height*.2,
                                            right: MediaQuery.sizeOf(context).width * .02,

                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.save, color: Colors.black.withOpacity(.7),),
                                                  const SizedBox(width: 4,),
                                                  Text("${double.parse("${AppCubit.get(context).newSellProducts![index].quantity}").toInt()}",style: const TextStyle(fontSize: 18),),
                                                ],
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            top: MediaQuery.sizeOf(context).height*.2,
                                            left: MediaQuery.sizeOf(context).height*.000005,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context).height*.07,
                                              height: MediaQuery.sizeOf(context).height*.05,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(10),),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    '${AppCubit.get(context).newSellProducts![index].wholePrice}\$',
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: ColorManager.white,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          // Positioned(
                                          //   top: MediaQuery.sizeOf(context)
                                          //           .height *
                                          //       .2,
                                          //   left:
                                          //       MediaQuery.sizeOf(context).width *
                                          //           .02,
                                          //   right:
                                          //       MediaQuery.sizeOf(context).width *
                                          //           .008,
                                          //   child: Row(
                                          //     children: [
                                          //       SizedBox(
                                          //         height: 50,
                                          //         width: 50,
                                          //         child: TextFormField(
                                          //           decoration:
                                          //               const InputDecoration(
                                          //             hintStyle: TextStyle(
                                          //               fontSize: 20,
                                          //             ),
                                          //             hintText: '1',
                                          //           ),
                                          //           textAlign: TextAlign.center,
                                          //           style: const TextStyle(
                                          //               fontSize: 20),
                                          //           controller: AppCubit.get(
                                          //                       context)
                                          //                   .productsNewSellControllers[
                                          //               index],
                                          //           keyboardType:
                                          //               TextInputType.number,
                                          //         ),
                                          //       ),
                                          //       const Spacer(),
                                          //       Align(
                                          //         alignment: Alignment.bottomLeft,
                                          //         child: Text(
                                          //             '${AppCubit.get(context).newSellProducts![index].wholePrice}\$',
                                          //             style: GoogleFonts.cairo(
                                          //               fontSize: 20.0,
                                          //               fontWeight:
                                          //                   FontWeight.w600,
                                          //               color: ColorManager.black,
                                          //             )),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      )),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: AppCubit.get(context)
                                  .newSellProducts!
                                  .length),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.textColor,
                          ),
                        ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        AppLocalizations.of(context)!
                            .translate('bestSell')
                            .toString(),
                        style: GoogleFonts.cairo(
                          fontSize: MediaQuery.of(context).size.height * .023,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.black,
                        )),
                  ),

                  // المنتج الاكثر مبيعا
                  AppCubit.get(context).bestSellProducts!.isNotEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * .28,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (_){
                                      return OpenFullProduct(
                                        productPrice: '${AppCubit.get(context).bestSellProducts![index].wholePrice}',
                                        productCode: '${AppCubit.get(context).bestSellProducts![index].productModelGuide}',
                                        productImage: '${AppCubit.get(context).bestSellProducts![index].imgUrl}',
                                        productTitle: '${CashHelper.getData(
                                            key: CashHelper.languageKey)
                                            .toString() ==
                                            "ar"?AppCubit.get(context).bestSellProducts![index].productName:AppCubit.get(context).newSellProducts![index].latinName}',
                                        quantity: AppCubit.get(context).bestSellProducts![index].quantity,
                                      );
                                    }));
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width:
                                          MediaQuery.sizeOf(context).width * .5,
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
                                              imageUrl:
                                                  '${AppCubit.get(context).bestSellProducts![index].imgUrl}',
                                              height: 70,
                                              width: 70,
                                              placeholder: (context, url) =>
                                                  const Center(
                                                child: CircularProgressIndicator(
                                                  color: ColorManager.red,
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) => Center(
                                                child: Image.asset(
                                                  'assets/images/logo1.PNG',
                                                ),
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
                                          //         color: Colors.grey.shade100,
                                          //         borderRadius:
                                          //             BorderRadius.circular(40)),
                                          //     child: IconButton(
                                          //         onPressed: () {
                                          //           AppCubit.get(context)
                                          //               .allFavorite
                                          //               .clear();
                                          //           AppCubit.get(context)
                                          //               .insertDatabase(
                                          //                   name:
                                          //                   '${CashHelper.getData(
                                          //                       key: CashHelper.languageKey)
                                          //                       .toString() ==
                                          //                       "ar"? AppCubit.get(context).bestSellProducts![index].productName:AppCubit.get(context).bestSellProducts![index].latinName}',
                                          //                   code:
                                          //                       '${AppCubit.get(context).bestSellProducts![index].productModelGuide}',
                                          //                   price:
                                          //                       '${AppCubit.get(context).bestSellProducts![index].wholePrice}',
                                          //                   number: AppCubit.get(
                                          //                                   context)
                                          //                               .productsBestSellControllers[
                                          //                                   index]
                                          //                               .text ==
                                          //                           ''
                                          //                       ? '1'
                                          //                       : AppCubit.get(
                                          //                               context)
                                          //                           .productsBestSellControllers[
                                          //                               index]
                                          //                           .text,
                                          //                   image:
                                          //                       "${AppCubit.get(context).bestSellProducts![index].imgUrl}",
                                          //                   context: context)
                                          //               .then((value) {
                                          //             customToast(
                                          //                 color: ColorManager
                                          //                     .red,
                                          //                 title: AppLocalizations
                                          //                         .of(context)!
                                          //                     .translate(
                                          //                         'addedToCart')
                                          //                     .toString());
                                          //           }).then((value) {
                                          //             AppCubit.get(context)
                                          //                 .increaseCounter();
                                          //             AppCubit.get(
                                          //                 context)
                                          //                 .productsBestSellControllers[
                                          //             index].clear();
                                          //           });
                                          //         },
                                          //         icon: const Icon(
                                          //           Icons.add,
                                          //           size: 25,
                                          //           color:
                                          //               ColorManager.primaryColor,
                                          //         )),
                                          //   ),
                                          // ),


                                          Positioned(
                                            top: MediaQuery.sizeOf(context)
                                                    .height *
                                                .12,
                                            left:
                                                MediaQuery.sizeOf(context).width *
                                                    .008,
                                            right:
                                                MediaQuery.sizeOf(context).width *
                                                    .008,
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                  '${CashHelper.getData(
                                                      key: CashHelper.languageKey)
                                                      .toString() ==
                                                      "ar"? AppCubit.get(context).bestSellProducts![index].productName:AppCubit.get(context).bestSellProducts![index].latinName}',
                                                  style: GoogleFonts.cairo(
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: ColorManager.black,
                                                  )),
                                            ),
                                          ),
                                          Positioned(
                                            top: MediaQuery.sizeOf(context).height*.2,
                                            right: MediaQuery.sizeOf(context).width * .02,

                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.save, color: Colors.black.withOpacity(.7),),
                                                  const SizedBox(width: 4,),
                                                  Text("${double.parse("${AppCubit.get(context).bestSellProducts![index].quantity}").toInt()}",style: const TextStyle(fontSize: 18),),
                                                ],
                                              ),
                                            ),
                                          ),


                                          Positioned(
                                            top: MediaQuery.sizeOf(context).height*.2,
                                            left: MediaQuery.sizeOf(context).height*.000005,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context).height*.07,
                                              height: MediaQuery.sizeOf(context).height*.05,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(10),),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    '${AppCubit.get(context).bestSellProducts![index].wholePrice}\$',
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: ColorManager.white,
                                                    )),
                                              ),
                                            ),
                                          ),


                                          // Positioned(
                                          //   top: MediaQuery.sizeOf(context)
                                          //           .height *
                                          //       .2,
                                          //   left:
                                          //       MediaQuery.sizeOf(context).width *
                                          //           .02,
                                          //   right:
                                          //       MediaQuery.sizeOf(context).width *
                                          //           .008,
                                          //   child: Row(
                                          //     children: [
                                          //       SizedBox(
                                          //         height: 50,
                                          //         width: 50,
                                          //         child: TextFormField(
                                          //           decoration:
                                          //               const InputDecoration(
                                          //             hintStyle: TextStyle(
                                          //               fontSize: 20,
                                          //             ),
                                          //             hintText: '1',
                                          //           ),
                                          //           textAlign: TextAlign.center,
                                          //           style: const TextStyle(
                                          //               fontSize: 20),
                                          //           controller: AppCubit.get(
                                          //                       context)
                                          //                   .productsBestSellControllers[
                                          //               index],
                                          //           keyboardType:
                                          //               TextInputType.number,
                                          //         ),
                                          //       ),
                                          //       const Spacer(),
                                          //       Align(
                                          //         alignment: Alignment.bottomLeft,
                                          //         child: Text(
                                          //             '${AppCubit.get(context).bestSellProducts![index].wholePrice}\$',
                                          //             style: GoogleFonts.cairo(
                                          //               fontSize: 20.0,
                                          //               fontWeight:
                                          //                   FontWeight.w600,
                                          //               color: ColorManager.black,
                                          //             )),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      )),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: AppCubit.get(context)
                                  .bestSellProducts!
                                  .length),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.textColor,
                          ),
                        ),

                  const SizedBox(height: 20,),
                ],
              ),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
