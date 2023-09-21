import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/presentation/screens/car_name/car_name.dart';
import 'package:cars_app/presentation/screens/search_screen/search_screen.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/widgets/default_text_field.dart';
import 'package:cars_app/widgets/recomended_item.dart';
import 'package:cars_app/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/brand_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: ColorManager.textColor),
          backgroundColor: ColorManager.primaryColor,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: ColorManager.lightColor,
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(
                    'assets/images/logo1.PNG',
                  ),
                  color: Colors.red,
                  fit: BoxFit.fill,
                  width: MediaQuery.sizeOf(context).width * .2,
                  height: MediaQuery.sizeOf(context).height * .1,
                ),
                Text('Nissan Group',
                    style: GoogleFonts.cairo(
                  fontSize: MediaQuery.of(context).size.height * .03,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ))
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SearchScreen(),
                    ));
              },
              child: const Padding(
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
                        image: NetworkImage(e),
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
                                return const CarName(
                                  brandName: '',
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
                    child: Text('المنتج الموصي بيه',
                        style: GoogleFonts.cairo(
                          fontSize: MediaQuery.of(context).size.height * .023,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.black,
                        )),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  // المنتج الموصي بيه
                  AppCubit.get(context)
                          .favoriteProducts!
                          .mainProducts!
                          .isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.textColor,
                          ),
                        ):SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
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
                      AppCubit.get(context).newSellProducts!.length,
                    ),
                  ),


                  const SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('احدث المنتجات',
                        style: GoogleFonts.cairo(
                          fontSize: MediaQuery.of(context).size.height * .023,
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
                          height: MediaQuery.of(context).size.height * .3,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
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
                                        Positioned(
                                          left: 10,
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
                                                'assets/images/logo1.PNG',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            height: 70,
                                            width: 70,
                                          ),
                                        ),
                                        Positioned(
                                          top: MediaQuery.sizeOf(context)
                                                  .height *
                                              .05,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            child: IconButton(
                                                onPressed: () {
                                                  AppCubit.get(context)
                                                      .allFavorite
                                                      .clear();
                                                  AppCubit.get(context)
                                                      .insertDatabase(
                                                          name:
                                                              '${AppCubit.get(context).newSellProducts![index].productName}',
                                                          code:
                                                              '${AppCubit.get(context).newSellProducts![index].productModelGuide}',
                                                          price:
                                                              '${AppCubit.get(context).newSellProducts![index].wholePrice}\$',
                                                          number: AppCubit.get(
                                                                          context)
                                                                      .productsNewSellControllers[
                                                                          index]
                                                                      .text ==
                                                                  ''
                                                              ? '1'
                                                              : AppCubit.get(
                                                                      context)
                                                                  .productsNewSellControllers[
                                                                      index]
                                                                  .text,
                                                          image:
                                                              '${AppCubit.get(context).newSellProducts![index].imgUrl}',
                                                          context: context)
                                                      .then((value) {
                                                    customToast(
                                                        color: ColorManager
                                                            .darkGrey,
                                                        title:
                                                            'تم اضافه المنتج في السله');
                                                  }).then((value) {
                                                    AppCubit.get(context)
                                                        .increaseCounter();
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 25,
                                                  color:
                                                      ColorManager.primaryColor,
                                                )),
                                          ),
                                        ),
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
                                                '${AppCubit.get(context).newSellProducts![index].productName}',
                                                style: GoogleFonts.cairo(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.black,
                                                )),
                                          ),
                                        ),
                                        Positioned(
                                          top: MediaQuery.sizeOf(context)
                                                  .height *
                                              .2,
                                          left:
                                              MediaQuery.sizeOf(context).width *
                                                  .02,
                                          right:
                                              MediaQuery.sizeOf(context).width *
                                                  .008,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    hintStyle: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    hintText: '0',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                  controller: AppCubit.get(
                                                              context)
                                                          .productsNewSellControllers[
                                                      index],
                                                  keyboardType:
                                                      TextInputType.number,
                                                ),
                                              ),
                                              const Spacer(),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                    '${AppCubit.get(context).newSellProducts![index].wholePrice}\$',
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: ColorManager.black,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ));
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
                    child: Text('المنتج الاكثر مبيعا',
                        style: GoogleFonts.cairo(
                          fontSize: MediaQuery.of(context).size.height * .023,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.black,
                        )),
                  ),

                  // المنتج الاكثر مبيعا
                  AppCubit.get(context).bestSellProducts!.isNotEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * .3,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
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
                                        Positioned(
                                          left: 10,
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
                                        Positioned(
                                          top: MediaQuery.sizeOf(context)
                                                  .height *
                                              .05,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            child: IconButton(
                                                onPressed: () {
                                                  AppCubit.get(context)
                                                      .allFavorite
                                                      .clear();
                                                  AppCubit.get(context)
                                                      .insertDatabase(
                                                          name:
                                                              '${AppCubit.get(context).bestSellProducts![index].productName}',
                                                          code:
                                                              '${AppCubit.get(context).bestSellProducts![index].productModelGuide}',
                                                          price:
                                                              '${AppCubit.get(context).bestSellProducts![index].wholePrice}\$',
                                                          number: AppCubit.get(
                                                                          context)
                                                                      .productsBestSellControllers[
                                                                          index]
                                                                      .text ==
                                                                  ''
                                                              ? '1'
                                                              : AppCubit.get(
                                                                      context)
                                                                  .productsBestSellControllers[
                                                                      index]
                                                                  .text,
                                                          image:
                                                              "${AppCubit.get(context).bestSellProducts![index].imgUrl}",
                                                          context: context)
                                                      .then((value) {
                                                    customToast(
                                                        color: ColorManager
                                                            .darkGrey,
                                                        title:
                                                            'تم اضافه المنتج في السله');
                                                  }).then((value) {
                                                    AppCubit.get(context)
                                                        .increaseCounter();
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 25,
                                                  color:
                                                      ColorManager.primaryColor,
                                                )),
                                          ),
                                        ),
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
                                                '${AppCubit.get(context).bestSellProducts![index].productName}',
                                                style: GoogleFonts.cairo(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.black,
                                                )),
                                          ),
                                        ),
                                        Positioned(
                                          top: MediaQuery.sizeOf(context)
                                                  .height *
                                              .2,
                                          left:
                                              MediaQuery.sizeOf(context).width *
                                                  .02,
                                          right:
                                              MediaQuery.sizeOf(context).width *
                                                  .008,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    hintStyle: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    hintText: '0',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                  controller: AppCubit.get(
                                                              context)
                                                          .productsBestSellControllers[
                                                      index],
                                                  keyboardType:
                                                      TextInputType.number,
                                                ),
                                              ),
                                              const Spacer(),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                    '${AppCubit.get(context).bestSellProducts![index].wholePrice}\$',
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: ColorManager.black,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ));
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
