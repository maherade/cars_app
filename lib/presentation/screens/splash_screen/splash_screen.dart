
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/presentation/screens/login_screen/login_screen.dart';
import 'package:cars_app/presentation/screens/on_boarding/on_boarding.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    //
    Future.delayed(const Duration(seconds: 3),()async{

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const OnBoarding()
        ), (Route<dynamic> route) => false);


    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
      builder: (context,state){
          return Scaffold(
            appBar: AppBar(

              toolbarHeight: 0.0,
              elevation: 0.0,
              systemOverlayStyle: const SystemUiOverlayStyle(

                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white,
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children:  [

                  SizedBox(height: MediaQuery.of(context).size.height*.22,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Lottie.asset(
                      'assets/images/car_animated1.json',
                      width: double.infinity,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*.02,),

                  Text(
                    'سيارتك',
                    style: GoogleFonts.cairo(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.darkGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),


                ],
              ),
            ),
          );
      },
    );
  }
}
