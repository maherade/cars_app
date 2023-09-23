import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/localization_cubit/app_localization.dart';
import 'package:cars_app/constants/stripe/stripe_keys.dart';
import 'package:cars_app/widgets/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class PaymentManager{

  static Future<void>makePayment(int amount,String currency,context)async{
    try {
      String clientSecret=await _getClientSecret((amount*100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet().then((value) {
        print('///////////////Hello////////');
        AppCubit.get(context).addUserPaymentToFireBase();
      });
    } catch (error) {
      customToast(title: AppLocalizations.of(context)!.translate('Not Completed').toString(), color: Colors.red);
      throw Exception(error.toString());
    }
  }

  static Future<void>_initializePaymentSheet(String clientSecret)async{
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Reda",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount,String currency)async{
    Dio dio=Dio();
    var response= await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    return response.data["client_secret"];
  }

}