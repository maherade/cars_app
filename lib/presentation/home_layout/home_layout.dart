import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/business_logic/localization_cubit/app_localization.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/utiles/local/cash_helper.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.primaryColor,
            elevation: 0.0,
            toolbarHeight: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            title: Text(cubit.screenTitles[cubit.currentIndex]),
          ),
          body: cubit.userModel != null
              ? Scaffold(body: cubit.screenName[cubit.currentIndex])
              : const Scaffold(
                  body: SafeArea(
                      child: Center(
                    child: CircularProgressIndicator(),
                  )),
                ),

          bottomNavigationBar: CurvedNavigationBar(
            key: bottomNavigationKey,
            backgroundColor: Colors.transparent,
            color: ColorManager.primaryColor,
            animationCurve: Curves.easeInOut,
            height: MediaQuery.sizeOf(context).height * .09,
            items: [
              CurvedNavigationBarItem(
                  child: const Icon(
                    Icons.home,
                    size: 20,
                    color: Colors.white,
                  ),
                  label: AppLocalizations.of(context)!
                      .translate('home')
                      .toString(),
                  labelStyle:
                      const TextStyle(fontSize: 12, color: Colors.white)),
                CurvedNavigationBarItem(
                  child:  const Icon(Icons.branding_watermark,
                      size: 20, color: Colors.white),
                  label: AppLocalizations.of(context)!.translate("brands").toString(),
                  labelStyle:
                      const  TextStyle(fontSize: 12, color: Colors.white)),
              CurvedNavigationBarItem(
                  child: Stack(
                    children: [
                      CashHelper.getData(key: 'counter') == null
                          ? cubit.currentIndex != 2
                          ? Positioned(
                        height:
                        MediaQuery.sizeOf(context).height * .035,
                        top: MediaQuery.sizeOf(context).height * .2,
                        right: MediaQuery.sizeOf(context).width * .15,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height *
                              .035,
                          width:
                          MediaQuery.sizeOf(context).width * .07,
                          decoration: BoxDecoration(
                              color: Colors.red.shade500,
                              borderRadius:
                              BorderRadius.circular(15)),
                          child: Center(
                            child: Text('0',
                                style: GoogleFonts.cairo(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                )),
                          ),
                        ),
                      )
                          : Positioned(
                        height:
                        MediaQuery.sizeOf(context).height * .035,
                        top: MediaQuery.sizeOf(context).height * .15,
                        right: MediaQuery.sizeOf(context).width * .05,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height *
                              .035,
                          width:
                          MediaQuery.sizeOf(context).width * .07,
                          decoration: BoxDecoration(
                              color: Colors.red.shade500,
                              borderRadius:
                              BorderRadius.circular(15)),
                          child: Center(
                            child: Text('0',
                                style: GoogleFonts.cairo(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                )),
                          ),
                        ),
                      )
                          : cubit.currentIndex == 2
                          ? Positioned(
                        height:
                        MediaQuery.sizeOf(context).height * .035,
                        top: MediaQuery.sizeOf(context).height * .1,
                        right: MediaQuery.sizeOf(context).width * .12,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height *
                              .035,
                          width:
                          MediaQuery.sizeOf(context).width * .07,
                          decoration: BoxDecoration(
                              color: Colors.red.shade500,
                              borderRadius:
                              BorderRadius.circular(15)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${cubit.allFavorite.length}',
                              style: GoogleFonts.cairo(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        ),
                      )
                          : Positioned(
                        height:
                        MediaQuery.sizeOf(context).height * .035,
                        top:
                        MediaQuery.sizeOf(context).height * .0001,
                        right: MediaQuery.sizeOf(context).width * .13,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height *
                              .035,
                          width:
                          MediaQuery.sizeOf(context).width * .07,
                          decoration: BoxDecoration(
                              color: Colors.red.shade500,
                              borderRadius:
                              BorderRadius.circular(15)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${cubit.allFavorite.length}',
                              style: GoogleFonts.cairo(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.shopping_bag,
                              size: 20, color: Colors.white)),
                    ],
                  ),
                  label: AppLocalizations.of(context)!
                      .translate('cart')
                      .toString(),
                  labelStyle:
                  const TextStyle(fontSize: 12, color: Colors.white)),
              CurvedNavigationBarItem(
                  child:
                      const Icon(Icons.history, size: 20, color: Colors.white),
                  label:
                      AppLocalizations.of(context)!.translate('buy').toString(),
                  labelStyle:
                      const TextStyle(fontSize: 12, color: Colors.white)),

              CurvedNavigationBarItem(
                  child:
                      const Icon(Icons.settings, size: 20, color: Colors.white),
                  label: AppLocalizations.of(context)!
                      .translate('settings')
                      .toString(),
                  labelStyle:
                      const TextStyle(fontSize: 12, color: Colors.white)),
            ],
            onTap: (index) {
              cubit.setIndex(index);
            },
          ),

        );
      },
    );
  }
}
