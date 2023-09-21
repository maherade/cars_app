
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/presentation/home_layout/home_layout.dart';
import 'package:cars_app/presentation/screens/login_screen/login_screen.dart';
import 'package:cars_app/presentation/screens/on_boarding/on_boarding.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/utiles/local/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget ?widget;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(const Duration(seconds: 3),()async{

      AppCubit.get(context).getFavoriteProductFromApi().then((value) {
        CashHelper.getData(key: 'isUid')==null?

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const LoginScreen()
        ), (Route<dynamic> route) => false)

            :{
          AppCubit.get(context).favoriteProducts!.mainProducts!.isNotEmpty?
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          const HomeLayout()
          ), (Route<dynamic> route) => false):Container()
        };
      });


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
              backgroundColor: ColorManager.grey,
              systemOverlayStyle: const SystemUiOverlayStyle(

                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white,
              ),
            ),
            body: Container(
              decoration:  BoxDecoration(
                  color: ColorManager.grey
              ),
              height: double.infinity,
              width: double.infinity,
              child: Stack(

                children:  [

                  Positioned(
                    top: MediaQuery.of(context).size.height*.15,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image(
                        image: const AssetImage(
                          'assets/images/logo1.PNG',
                        ),
                        width: MediaQuery.of(context).size.height*.5,
                        height: MediaQuery.of(context).size.height*.5,
                      )
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*.02,),


                ],
              ),
            ),
          );
      },
    );
  }
}
