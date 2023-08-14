import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/presentation/screens/login_screen/login_screen.dart';
import 'package:cars_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
            titleSpacing: 0.0,
            iconTheme: const IconThemeData(color: ColorManager.textColor),
            backgroundColor: ColorManager.primaryColor,
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorManager.lightColor,
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorManager.lightColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'الإعدادات',
              style: GoogleFonts.cairo(
                fontSize: 20.0,
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
                GestureDetector(
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
                              'الحساب',
                              style: GoogleFonts.cairo(
                                fontSize: 20.0,
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
                GestureDetector(
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
                              'السياسات & الخصوصية',
                              style: GoogleFonts.cairo(
                                fontSize: 20.0,
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
                GestureDetector(
                  onTap: () {},
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
                              'اللغة',
                              style: GoogleFonts.cairo(
                                fontSize: 20.0,
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
                //Log Out
                GestureDetector(
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
                              'تسجيل الخروج',
                              style: GoogleFonts.cairo(
                                fontSize: 20.0,
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
                GestureDetector(
                  onTap: () {
                    cubit
                        .deleteUser(
                            id: (cubit.userModel!.uId)!, context: context)
                        .then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const LoginScreen()), (route) => false));
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
                              'حذف الحساب',
                              style: GoogleFonts.cairo(
                                fontSize: 20.0,
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
                Divider(
                  height: mediaQuery.height * .01,
                  color: ColorManager.primaryColor,
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
