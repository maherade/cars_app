import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_app/constants/stripe/payment_manager.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/widgets/defualtButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../business_logic/app_cubit/app_cubit.dart';
import '../../business_logic/app_cubit/app_states.dart';
import '../../business_logic/localization_cubit/app_localization.dart';
import '../../utiles/local/cash_helper.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.lightColor,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorManager.textColor),
            backgroundColor: ColorManager.primaryColor,
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorManager.lightColor,
            ),
            title: Text(
              AppLocalizations.of(context)!.translate("cart").toString(),
              style: GoogleFonts.cairo(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: ColorManager.lightColor,
              ),
              textAlign: TextAlign.center,
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(
                            child: Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("paymentWay")
                                      .toString(),
                                  style: GoogleFonts.cairo(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: ColorManager.textColor,
                                  ),
                                ),
                                Center(
                                  child: Lottie.asset(
                                    "assets/images/cash.json",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                DefaultButton(
                                    buttonText: AppLocalizations.of(context)!
                                        .translate("cash")
                                        .toString(),
                                    color: Colors.black,
                                    color2: Colors.black,
                                    onPressed: () {}),
                                const SizedBox(
                                  height: 10,
                                ),
                                DefaultButton(
                                  buttonText: AppLocalizations.of(context)!
                                      .translate("visa")
                                      .toString(),
                                  color: Colors.red.shade800,
                                  color2: Colors.red.shade800,
                                  onPressed: () {
                                    PaymentManager.makePayment(200, "USD").then(
                                        (value) => Navigator.of(context).pop());
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DefaultButton(
                                  buttonText: AppLocalizations.of(context)!
                                      .translate("transfair")
                                      .toString(),
                                  color: Colors.green.shade800,
                                  color2: Colors.green.shade800,
                                  onPressed: () {

                                  },
                                ),
                              ],
                            ),
                          ),
                          // content: ,
                        );
                      });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * .02),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  width: MediaQuery.of(context).size.width * .25,
                  height: MediaQuery.of(context).size.width * .1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate("continue")
                          .toString(),
                      style: GoogleFonts.cairo(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                // CartItem(),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(
                                AppCubit.get(context).allFavorite[index]['id']);
                            // AppCubit.get(context).deleteDatabase(
                            //     id: '${AppCubit.get(context).allFavorite[index]['id']}',
                            //     context: context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height * .31,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl:
                                            '${AppCubit.get(context).allFavorite[index]['image']}',
                                        height: 70,
                                        width: 70,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(
                                            color: ColorManager.red,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Center(
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
                                                AppCubit.get(context)
                                                    .allFavorite[index]['name'],
                                                style: GoogleFonts.cairo(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.black,
                                                )),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.list_alt,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  AppCubit.get(context)
                                                          .allFavorite[index][
                                                      'rate'],
                                                  style: GoogleFonts.cairo(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: ColorManager.black,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                .20,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintStyle: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            hintText: cubit.allFavorite[index]
                                                    .isNotEmpty
                                                ? "0"
                                                : cubit
                                                    .editNumberController[index]
                                                    .text,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 20),
                                          controller:
                                              cubit.editNumberController[index],
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                          '${AppCubit.get(context).allFavorite[index]['price']}',
                                          style: GoogleFonts.cairo(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.black,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          cubit.updateDatabase(
                                              number: cubit
                                                  .editNumberController[index]
                                                  .text,
                                              id: '${cubit.allFavorite[index]['id']}');
                                          cubit
                                              .editUserProductsToFireBase(
                                              id: cubit.userModel!.uId!,
                                              number: cubit
                                                  .editNumberController[
                                              index]
                                                  .text,
                                              productId:
                                              '${cubit.allFavorite[index]['id']}')
                                              .then((value) => {
                                            AppCubit.get(context)
                                                .getUserProductsFromFireStore(),
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  .02),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                              BorderRadius.circular(12)),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .25,
                                          height: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .1,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.edit,
                                                  color: ColorManager.white,
                                                  size: 20,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .translate("edit")
                                                      .toString(),
                                                  style: GoogleFonts.cairo(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: ColorManager.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: () {
                                          print(AppCubit.get(context)
                                              .allFavorite[index]['id']);
                                          AppCubit.get(context).deleteDatabase(
                                              id: '${AppCubit.get(context).allFavorite[index]['id']}',
                                              context: context);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .02),
                                          decoration: BoxDecoration(
                                              color: Colors.red.shade500,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .25,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .1,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.delete,
                                                  color: ColorManager.white,
                                                  size: 20,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .translate("delete")
                                                      .toString(),
                                                  style: GoogleFonts.cairo(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: ColorManager.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
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
                      itemCount: AppCubit.get(context).allFavorite.length),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
