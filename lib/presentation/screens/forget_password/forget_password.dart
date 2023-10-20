import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/localization_cubit/app_localization.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  static var textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        elevation: 0.0,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: ColorManager.primaryColor,

        ),
        titleSpacing: 0.0,
        title: Text('تغير كلمه المرورٍ',style: GoogleFonts.cairo(
            fontSize: 17,
            fontWeight: FontWeight.w500
        ),),

      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12.0),
              child: DefaultTextField(
                  hintText:
                  AppLocalizations.of(context)!
                      .translate('email')
                      .toString(),
                  controller: textEditingController,
                  textInputType:
                  TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                  hintColor: ColorManager.primaryColor),
            ),

            Container(
              margin: EdgeInsets.only(
                  top: 60,
                  left: 15,
                  right: 15
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(40)),
              child: MaterialButton(
                  height: 50,
                  color: ColorManager.primaryColor,
                  textColor: Colors.white,

                  onPressed: (){
                    AppCubit.get(context).forgetPassword(email: textEditingController.text,context: context);
                  },
                  child: Text('اعاده تعين كلمه المرور',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),)),
            )
          ],
        ),
      ),
    );
  }
}
