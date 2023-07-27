import 'package:cars_app/presentation/home_layout/home_layout.dart';
import 'package:cars_app/presentation/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business_logic/app_cubit/app_cubit.dart';
import '../../../business_logic/app_cubit/app_states.dart';
import '../../../styles/color_manager.dart';
import '../../../widgets/default_text_field.dart';
import '../../../widgets/defualtButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.sizeOf(context);
    return BlocConsumer<AppCubit,AppStates>(
      builder: (context, state) {
        var cubit=AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorManager.primaryColor,
            body:Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: mediaQuery.height*.35),
                    width: double.infinity,
                    height: mediaQuery.height * .61,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(150),
                      ),
                    ),
                    child:SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: mediaQuery.height*.08,),
                          Text('تسجيل الدخول',style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w700,
                              fontSize: MediaQuery.of(context).size.height*.03,
                              color: ColorManager.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: mediaQuery.height*.04,),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: DefaultTextField(
                                          hintText: "البريد الإلكتروني",
                                          controller: emailController,
                                          textInputType: TextInputType.emailAddress,
                                          prefixIcon: Icons.email,
                                          hintColor: ColorManager.primaryColor
                                      ),
                                    ),
                                    SizedBox(
                                      height: mediaQuery.height * .02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: DefaultTextField(
                                        hintText: "كلمة المرور",
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
                                    state is SignUpLoadingState?
                                    const Center(
                                      child: CircularProgressIndicator(
                                        color: ColorManager.primaryColor,
                                      ),
                                    ):
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: DefaultButton(
                                          buttonText: "تسجيل الدخول",
                                          onPressed: () {
                                            if(formKey.currentState!.validate()){
                                              cubit.userLogin(
                                                  email: emailController.text,
                                                  password: passwordController.text
                                              ).then((value) => {
                                                emailController.clear(),
                                                  passwordController.clear(),
                                              });
                                            }
                                          },
                                          width: mediaQuery.width * .6,
                                          color2: ColorManager.primaryColor),
                                    ),
                                    SizedBox(
                                      height: mediaQuery.height * .01,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "ليس لديك حساب؟",
                                          style: GoogleFonts.cairo(
                                              fontWeight: FontWeight.w500,
                                              color: ColorManager.textColor),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                      const RegisterScreen()));
                                            },
                                            child: Text(
                                              "إنشاء حساب",
                                              style: GoogleFonts.cairo(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager.primaryColor),
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
      listener:(context, state) {

        if(state is LoginSuccessState){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          const HomeLayout()
          ), (Route<dynamic> route) => false);        }

      },

    );
  }
}
