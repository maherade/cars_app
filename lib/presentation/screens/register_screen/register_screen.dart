import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/presentation/home_layout/home_layout.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/utiles/local/cash_helper.dart';
import 'package:cars_app/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business_logic/app_cubit/app_states.dart';
import '../../../business_logic/localization_cubit/app_localization.dart';
import '../../../widgets/defualtButton.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorManager.red.withOpacity(.8),
            body: Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorManager.white,
                      size: mediaQuery.height * .026,
                    )),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: mediaQuery.height * .26),
                    width: double.infinity,
                    height: mediaQuery.height * .7,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(150),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: mediaQuery.height * .04,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .translate("createNewAccount")
                                .toString(),
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.height * .03,
                                color: ColorManager.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: mediaQuery.height * .04,
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: DefaultTextField(
                                        hintText: AppLocalizations.of(context)!
                                            .translate("userName")
                                            .toString(),
                                        controller: cubit.userNameController,
                                        textInputType: TextInputType.name,
                                        prefixIcon: Icons.person,
                                        hintColor: ColorManager.primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: mediaQuery.height * .02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: DefaultTextField(
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .translate("phone")
                                                  .toString(),
                                          controller: phoneController,
                                          textInputType: TextInputType.phone,
                                          prefixIcon: Icons.phone,
                                          hintColor: ColorManager.primaryColor),
                                    ),
                                    SizedBox(
                                      height: mediaQuery.height * .02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: DefaultTextField(
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .translate("email")
                                                  .toString(),
                                          controller: emailController,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          prefixIcon: Icons.email,
                                          hintColor: ColorManager.primaryColor),
                                    ),
                                    SizedBox(
                                      height: mediaQuery.height * .02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: DefaultTextField(
                                        hintText: AppLocalizations.of(context)!
                                            .translate("password")
                                            .toString(),
                                        controller: passwordController,
                                        textInputType: TextInputType.text,
                                        prefixIcon: Icons.lock,
                                        hintColor: ColorManager.primaryColor,
                                        isPass: true,
                                      ),
                                    ),
                                    SizedBox(
                                      height: mediaQuery.height * .02,
                                    ),
                                    state is SignUpLoadingState
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: ColorManager.primaryColor,
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: DefaultButton(
                                                buttonText: AppLocalizations.of(
                                                        context)!
                                                    .translate("createAccount")
                                                    .toString(),
                                                onPressed: () {
                                                  validateForm(
                                                      const HomeLayout());
                                                },
                                                width: mediaQuery.width * .6,
                                                color2:
                                                    ColorManager.primaryColor),
                                          ),
                                    SizedBox(
                                      height: mediaQuery.height * .01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!
                                              .translate("haveAccount")
                                              .toString(),
                                          style: GoogleFonts.cairo(
                                              fontWeight: FontWeight.w500,
                                              color: ColorManager.textColor),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginScreen()));
                                            },
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .translate("login")
                                                  .toString(),
                                              style: GoogleFonts.cairo(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager
                                                      .primaryColor),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  void validateForm(Widget widget) {
    if (formKey.currentState!.validate()) {
      CashHelper.saveData(
          key: 'userName',
          value: AppCubit.get(context).userNameController.text);
      AppCubit.get(context).createAccountWithFirebaseAuth(
          name: AppCubit.get(context).userNameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text);
      emailController.clear();
      passwordController.clear();
      AppCubit.get(context).userNameController.clear();
      phoneController.clear();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => widget));
    }
  }
}
