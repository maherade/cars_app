import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/utiles/local/cash_helper.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

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
            backgroundColor: Colors.transparent,
            color: ColorManager.primaryColor,
            animationCurve: Curves.easeInOut,
            height: MediaQuery.sizeOf(context).height * .079,
            items: <Widget>[
              const Icon(
                Icons.home,
                size: 20,
                color: Colors.white,
              ),
              const Icon(Icons.branding_watermark,
                  size: 20, color: Colors.white),
              Stack(
                children: [
                  CashHelper.getData(key: 'counter') == null
                      ? cubit.currentIndex == 2
                          ? Positioned(
                              height: MediaQuery.sizeOf(context).height * .035,
                              top: MediaQuery.sizeOf(context).height * .1,
                              right: MediaQuery.sizeOf(context).width * .12,
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * .035,
                                width: MediaQuery.sizeOf(context).width * .07,
                                decoration: BoxDecoration(
                                    color: Colors.red.shade500,
                                    borderRadius: BorderRadius.circular(15)),
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
                              height: MediaQuery.sizeOf(context).height * .035,
                              top: MediaQuery.sizeOf(context).height * .1,
                              right: MediaQuery.sizeOf(context).width * .12,
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * .035,
                                width: MediaQuery.sizeOf(context).width * .07,
                                decoration: BoxDecoration(
                                    color: Colors.red.shade500,
                                    borderRadius: BorderRadius.circular(15)),
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
                              height: MediaQuery.sizeOf(context).height * .035,
                              top: MediaQuery.sizeOf(context).height * .1,
                              right: MediaQuery.sizeOf(context).width * .12,
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * .035,
                                width: MediaQuery.sizeOf(context).width * .07,
                                decoration: BoxDecoration(
                                    color: Colors.red.shade500,
                                    borderRadius: BorderRadius.circular(15)),
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
                              height: MediaQuery.sizeOf(context).height * .035,
                              top: MediaQuery.sizeOf(context).height * .015,
                              right: MediaQuery.sizeOf(context).width * .12,
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * .035,
                                width: MediaQuery.sizeOf(context).width * .07,
                                decoration: BoxDecoration(
                                    color: Colors.red.shade500,
                                    borderRadius: BorderRadius.circular(15)),
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
              const Icon(Icons.history, size: 20, color: Colors.white),
              const Icon(Icons.settings, size: 20, color: Colors.white),
            ],
            onTap: (index) {
              cubit.setIndex(index);
            },
          ),

          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: cubit.currentIndex,
          //   onTap: (value){
          //     cubit.setIndex(value);
          //   },
          //   backgroundColor: ColorManager.primaryColor,
          //   type: BottomNavigationBarType.fixed,
          //   selectedItemColor: Colors.white,
          //   selectedLabelStyle: GoogleFonts.cairo(
          //     fontSize: 12
          //   ),
          //   unselectedItemColor: Colors.grey,
          //   items: const [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'الرئيسيه',
          //     ),
          //
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.branding_watermark,),
          //       label: 'الماركات',
          //       backgroundColor: Colors.white
          //     ),
          //
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.card_travel),
          //       label: 'هويه التسوق',
          //     ),
          //
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.shopping_bag),
          //       label: 'يشتري',
          //     ),
          //
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.fact_check),
          //       label: 'ايصال',
          //     ),
          //
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.settings),
          //       label: 'الاعدادات',
          //     ),
          //   ],
          // ),
        );
      },
    );
  }
}
