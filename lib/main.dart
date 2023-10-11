import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/localization_cubit/app_localization.dart';
import 'package:cars_app/business_logic/localization_cubit/localization_cubit.dart';
import 'package:cars_app/business_logic/localization_cubit/localization_states.dart';
import 'package:cars_app/constants/constatnts.dart';
import 'package:cars_app/constants/stripe/stripe_keys.dart';
import 'package:cars_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/utiles/local/cash_helper.dart';
import 'package:cars_app/utiles/remote/dio_helper.dart';
import 'package:cars_app/utiles/remote/dio_helper2/dio_helper2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  Stripe.publishableKey=ApiKeys.publishedKey;
  await DioHelper.init();
  await DioHelper2.init();
  uId=CashHelper.getData(key: 'isUid');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..createDatabase()
              ..initializeVideoPlayer()
              ..getMostProductSell()
              ..getNewProduct()
              ..getUser(id: uId==null?uId='':uId!)
        ),
        BlocProvider(
            create: (BuildContext context) =>
            LocalizationCubit()..fetchLocalization()),
      ],
      child: BlocConsumer<LocalizationCubit, LocalizationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: ColorManager.textColor,
              appBarTheme: const
              AppBarTheme(
                iconTheme: IconThemeData(
                    color: Colors.black
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: ColorManager.lightColor,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home:  const SplashScreen(),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("he", ""),
              Locale("ar", ""),
            ],
            locale: LocalizationCubit.get(context).appLocal,
            localeResolutionCallback: (currentLang, supportLang) {
              if (currentLang != null) {
                for (Locale locale in supportLang) {
                  if (locale.languageCode == currentLang.languageCode) {
                    return currentLang;
                  }
                }
              }
              return supportLang.first;
            },

          );
        },
      ),
    );
  }
}

