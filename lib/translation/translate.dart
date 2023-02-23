import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:roxo/translation/helper.dart';

class TranslationService extends GetxService {
  final translations = Map<String, Map<String, String>>().obs;

  final translations1 = Map<String, Map<String, String>>().obs;
  // fallbackLocale saves the day when the locale gets in trouble
  final fallbackLocale = Locale('en', 'US');
  GetStorage? box;
  TranslationService() {
    box = new GetStorage();
  }

  // must add language codes here
  static final languages = [
    'en_US',
    'ar',
  ];
  Locale getLocale() {
    String? _locale = GetStorage().read<String>('language');
    if (_locale == null || _locale.isEmpty) {
      _locale = "en_US";
    }

    return Get.find<TranslationService>().fromStringToLocale(_locale);
  }

  void updateLocale(value) async {
    if (value.contains('_')) {
      // en_US
      Get.updateLocale(Locale(value.split('_').elementAt(0), value.split('_').elementAt(1)));
    } else {
      // en
      Get.updateLocale(Locale(value));
    }
    await box!.write('language', value);

    //Get.rootController.setTheme(Get.find<SettingsService>().getLightTheme());
  }

  // initialize the translation service by loading the assets/locales folder
  // the assets/locales folder must contains file for each language that named
  // with the code of language concatenate with the country code
  // for example (en_US.json)
  Future<TranslationService> init() async {
    languages.forEach((lang) async {
      var _file = await Helper.getJsonFile('assets/locales/${lang}.json');

      translations.putIfAbsent(lang, () => Map<String, String>.from(_file));
    });

    return this;
  }

  // get list of supported local in the application
  List<Locale> supportedLocales() {
    return TranslationService.languages.map((_locale) {
      return fromStringToLocale(_locale);
    }).toList();
  }

  // Convert string code to local object
  Locale fromStringToLocale(String _locale) {
    if (_locale.contains('_')) {
      // en_US
      return Locale(_locale.split('_').elementAt(0), _locale.split('_').elementAt(1));
    } else {
      // en
      return Locale(_locale);
    }
  }
}
