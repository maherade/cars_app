import 'dart:math';

import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/app_cubit/app_cubit.dart';
import '../../styles/color_manager.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorManager.textColor),
            backgroundColor: ColorManager.primaryColor,
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorManager.lightColor,
            ),
            title: Text(
              'يشتري',
              style: GoogleFonts.cairo(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: ColorManager.lightColor,
              ),
              textAlign: TextAlign.center,
            ),
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
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red),
                          child: Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height * .26,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            AppCubit.get(context).partNames.elementAt(Random().nextInt(AppCubit.get(context).partNames.length))),
                                        height: 70,
                                        width: 70,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                                AppCubit.get(context)
                                                    .userProduct[index]['name'],
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
                                                      .userProduct[index]['numberOfProducts'],
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
                                      const Icon(
                                        Icons.qr_code,
                                        color: Colors.black,
                                      ),
                                      Text(
                                          AppCubit.get(context).userProduct[index]
                                          ['code'],
                                          style: GoogleFonts.cairo(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.black,
                                          )),
                                      const Spacer(),
                                      Text( AppCubit.get(context)
                                          .userProduct[index]['price'],
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
                      itemCount: AppCubit.get(context).userProduct.length),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
