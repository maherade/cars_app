import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utiles/local/cash_helper.dart';
import 'localization_states.dart';



class LocalizationCubit extends Cubit<LocalizationStates>{

  LocalizationCubit() : super(InitialState());

  static LocalizationCubit get(context) => BlocProvider.of(context);

  Locale _appLocale = const Locale('he');

  Locale get appLocal => _appLocale;

  Future<void> fetchLocalization()async{
    String languageCode = CashHelper.getData(key: CashHelper.languageKey).toString();

    if(languageCode == 'null') {
      CashHelper.saveData(key: CashHelper.languageKey, value: "ar");
      CashHelper.saveData(key: CashHelper.languageNameKey, value: "langArabic");
      _appLocale = const Locale("ar");
      changeLanguage(code: "ar");
      debugPrint('default language is arabic');
      emit(FetchLocalizationState());
    } else{
      _appLocale = Locale(languageCode);
      debugPrint('default language is $languageCode');
      emit(FetchLocalizationState());
    }
    emit(FetchLocalizationState());
  }




  Future<void> changeLanguage({required String code})async{
    switch(code){
      case "ar":{
        _appLocale = const Locale("ar");
        CashHelper.saveData(key: CashHelper.languageKey,value: "ar");
        CashHelper.saveData(key: CashHelper.languageNameKey,value: "langArabic");
        debugPrint('App language is Arabic');
        emit(ChangeToArabicState());
      }
      break;
      case "he":{
        _appLocale = const Locale("he");
        CashHelper.saveData(key: CashHelper.languageKey,value: "he");
        CashHelper.saveData(key: CashHelper.languageNameKey,value: "langEnglish");
        debugPrint('App language is kurdish');
        emit(ChangeToEnglishState());
      }
      break;
    }
    emit(ChangeLanguageState());
  }



}