
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
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static Widget? widget;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(Duration(seconds: AppCubit.get(context).videoPlayerController!.value.duration.inSeconds), () async {
     AppCubit.get(context).initializeVideoPlayer();
      AppCubit.get(context).getFavoriteProductFromApi().then((value) {
        CashHelper.getData(key: 'isUid') == null
            ? Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false)
            : {
                AppCubit.get(context).favoriteProducts!.mainProducts!.isNotEmpty
                    ? Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const HomeLayout()),
                        (Route<dynamic> route) => false)
                    : Stack(
                  fit: StackFit.expand,
                  children: [
                    AppCubit.get(context).videoPlayerController!.value.isInitialized
                        ? AspectRatio(
                      aspectRatio:AppCubit.get(context). videoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(AppCubit.get(context).videoPlayerController!),
                    )
                        : Container(),
                  ],
                ),
              };
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.0,
            elevation: 0.0,
            backgroundColor: ColorManager.grey,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.black,
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
             AppCubit.get(context).videoPlayerController!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio:AppCubit.get(context). videoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(AppCubit.get(context).videoPlayerController!),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
