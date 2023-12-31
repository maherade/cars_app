import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/business_logic/localization_cubit/localization_cubit.dart';
import 'package:cars_app/presentation/screens/login_screen/login_screen.dart';
import 'package:cars_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/localization_cubit/app_localization.dart';
import '../../utiles/local/cash_helper.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var mediaQuery = MediaQuery.of(context).size;
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.lightColor,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorManager.white),
            backgroundColor: ColorManager.primaryColor,
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorManager.lightColor,
            ),
            title: Text(
              AppLocalizations.of(context)!.translate("settings").toString(),
              style: GoogleFonts.cairo(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: ColorManager.lightColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Profile
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ProfileScreen();
                      },
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: ColorManager.primaryColor,
                              size: 25,
                            ),
                            SizedBox(
                              width: mediaQuery.width * .02,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate("account")
                                  .toString(),
                              style: GoogleFonts.cairo(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: ColorManager.primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: mediaQuery.height * .01,
                  color: ColorManager.primaryColor,
                ),
                //Privacy
                InkWell(
                  onTap: () {
                    cubit.toPrivacy();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.lock,
                              color: ColorManager.primaryColor,
                              size: 25,
                            ),
                            SizedBox(
                              width: mediaQuery.width * .02,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate("privacy")
                                  .toString(),
                              style: GoogleFonts.cairo(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: ColorManager.primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: mediaQuery.height * .01,
                  color: ColorManager.primaryColor,
                ),
                //Language
                InkWell(
                  onTap: () {
                    print("${CashHelper.getData(
                        key: CashHelper.languageKey)
                        .toString() }");
                    if (CashHelper.getData(
                        key: CashHelper.languageKey)
                        .toString() ==
                        "ar") {
                      LocalizationCubit.get(context)
                          .changeLanguage(code: "en");
                    } else {
                      LocalizationCubit.get(context)
                          .changeLanguage(code: "ar");
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.language,
                              color: ColorManager.primaryColor,
                              size: 25,
                            ),
                            SizedBox(
                              width: mediaQuery.width * .02,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate("language")
                                  .toString(),
                              style: GoogleFonts.cairo(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          CashHelper.getData(
                              key: CashHelper.languageKey)
                              .toString() ==
                              "ar"
                              ? AppLocalizations.of(context)!
                                  .translate("arabic")
                                  .toString()
                              : AppLocalizations.of(context)!
                                  .translate("kurdi")
                                  .toString(),
                          style: GoogleFonts.cairo(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: mediaQuery.height * .01,
                  color: ColorManager.primaryColor,
                ),
                //Log Out
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (Route<dynamic> route) => false);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.logout,
                              color: ColorManager.primaryColor,
                              size: 25,
                            ),
                            SizedBox(
                              width: mediaQuery.width * .02,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate("logOut")
                                  .toString(),
                              style: GoogleFonts.cairo(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: ColorManager.primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: mediaQuery.height * .01,
                  color: ColorManager.primaryColor,
                ),
                //Delete Account
                InkWell(
                  onTap: () {
                    cubit
                        .deleteUser(
                            id: (cubit.userModel!.uId)!, context: context)
                        .then((value) => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()),
                            (route) => false));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red.shade700,
                              size: 25,
                            ),
                            SizedBox(
                              width: mediaQuery.width * .02,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .translate("deleteAccount")
                                  .toString(),
                              style: GoogleFonts.cairo(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.red.shade700,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
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
