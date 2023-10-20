import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/presentation/cart_screen/cart_screen.dart';
import 'package:cars_app/presentation/screens/open_full_product.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/utiles/local/cash_helper.dart';
import 'package:cars_app/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/localization_cubit/app_localization.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  var numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            titleSpacing: 0.0,
            backgroundColor: ColorManager.primaryColor,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.white),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!
                        .translate("products")
                        .toString(),
                    style: GoogleFonts.cairo(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return CartScreen();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    width: MediaQuery.of(context).size.width * .25,
                    height: MediaQuery.of(context).size.width * .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CashHelper.getData(key: 'counter') == null
                            ? Text('0',
                                style: GoogleFonts.cairo(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                ))
                            : Text(
                                '${cubit.allFavorite.length}',
                                style: GoogleFonts.cairo(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                ),
                              ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          color: Colors.white,
                          width: 2,
                        ),
                        const Icon(
                          Icons.card_travel,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   height: MediaQuery.of(context).size.height * .17,
                //   child: ListView.separated(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return GestureDetector(
                //           onTap: () {
                //             // Navigator.push(context, MaterialPageRoute(builder: (_){
                //             //   return const CarName(brandName: ,);
                //             // }));
                //           },
                //           child: CompanyWidget(index: index),
                //         );
                //       },
                //       separatorBuilder: (context, index) {
                //         return const SizedBox(
                //           width: 15,
                //         );
                //       },
                //       itemCount: AppCubit.get(context).companyNames.length),
                // ),

                const SizedBox(
                  height: 15,
                ),
                cubit.myProducts.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_){
                                    return OpenFullProduct(
                                      productPrice: '${cubit.products!.mainProducts![index].wholePrice}',
                                      productCode: '${cubit.products!.mainProducts![index].productModelGuide}',
                                      productImage: '${cubit.products!.mainProducts![index].imgUrl}',
                                      productTitle: '${CashHelper.getData(
                                          key: CashHelper.languageKey)
                                          .toString() ==
                                          "ar"?cubit.products!.mainProducts![index].productName:cubit.products!.mainProducts![index].latinName}',
                                    );
                                  }));
                                },
                                child: Material(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    height:
                                        MediaQuery.of(context).size.height * .32,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl:
                                                  '${cubit.products!.mainProducts![index].imgUrl}',
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
                                                  'assets/images/logo2.png',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                      '${CashHelper.getData(key: CashHelper.languageKey).toString() == "ar" ? cubit.products!.mainProducts![index].productName : cubit.products!.mainProducts![index].latinName}',
                                                      style: GoogleFonts.cairo(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: ColorManager.black,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Spacer(),
                                            Text(
                                                '${cubit.products!.mainProducts![index].wholePrice!}\$',
                                                style: GoogleFonts.cairo(
                                                  fontSize: 21.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.black,
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .15,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .15,
                                              padding: const EdgeInsets.all(2),
                                              child: TextFormField(
                                                decoration: const InputDecoration(
                                                  hintStyle: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                  hintText: '1',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    const TextStyle(fontSize: 20),
                                                controller: AppCubit.get(context)
                                                    .productsControllers[index],
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                            const Spacer(),
                                            MaterialButton(
                                              onPressed: () {
                                                AppCubit.get(context)
                                                    .allFavorite
                                                    .clear();
                                                AppCubit.get(context)
                                                    .insertDatabase(
                                                        name:
                                                            '${CashHelper.getData(key: CashHelper.languageKey).toString() == "ar" ? cubit.products!.mainProducts![index].productName : cubit.products!.mainProducts![index].latinName}',
                                                        code:
                                                            '${cubit.products!.mainProducts![index].productModelGuide}',
                                                        price:
                                                            '${cubit.products!.mainProducts![index].wholePrice}',
                                                        number: cubit
                                                                    .productsControllers[index]
                                                                    .text ==
                                                                ''
                                                            ? '1'
                                                            : cubit
                                                                .productsControllers[
                                                                    index]
                                                                .text,
                                                        image:
                                                            '${cubit.products!.mainProducts![index].imgUrl}',
                                                        context: context)
                                                    .then((value) {
                                                  customToast(
                                                    color: ColorManager.darkGrey,
                                                    title: AppLocalizations.of(
                                                            context)!
                                                        .translate("addedToCart")
                                                        .toString(),
                                                  );
                                                }).then((value) {
                                                  cubit.increaseCounter();
                                                  cubit.productsControllers[index].clear();
                                                });
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              color: ColorManager.primaryColor,
                                              child: Text(
                                                  AppLocalizations.of(context)!
                                                      .translate("add")
                                                      .toString(),
                                                  style: GoogleFonts.cairo(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: ColorManager.white,
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                            itemCount: cubit.myProducts.length),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.textColor,
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
