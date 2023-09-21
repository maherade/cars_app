import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business_logic/localization_cubit/app_localization.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.lightColor,
          appBar: AppBar(
            titleSpacing: 0.0,
            iconTheme: const IconThemeData(color: ColorManager.textColor),
            backgroundColor: ColorManager.primaryColor,
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: ColorManager.textColor,
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
              AppLocalizations.of(context)!.translate("account").toString(),
              style: GoogleFonts.cairo(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: ColorManager.lightColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                //name
                Row(
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.translate("userName").toString()}: ${cubit.userModel!.userName}',
                      style: GoogleFonts.almarai(
                          color: ColorManager.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * .025),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * .01,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                const Divider(
                  color: ColorManager.textColor,
                ),
                //email
                Row(
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.translate("email").toString()}: ${cubit.userModel!.email}',
                      style: GoogleFonts.almarai(
                          color: ColorManager.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * .025),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * .01,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                const Divider(
                  color: ColorManager.textColor,
                ),
                //phone
                Row(
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.translate("phone").toString()}: ${cubit.userModel!.phoneNumber}',
                      style: GoogleFonts.almarai(
                          color: ColorManager.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * .025),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * .01,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                const Divider(
                  color: ColorManager.textColor,
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
