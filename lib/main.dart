import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:roxo/routes/app_pages.dart';
import 'package:roxo/translation/translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Components/custom_splash.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => TranslationService().init());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
    ;
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, __) => GetMaterialApp(
        title: 'Roxn',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Get.find<TranslationService>().supportedLocales(),
        translationsKeys: Get.find<TranslationService>().translations,
        locale: Get.find<TranslationService>().getLocale(),
        fallbackLocale: Get.find<TranslationService>().fallbackLocale,
        //locale: DevicePreview.locale(context),
        getPages: AppPages.routes,
        //! Spalash Screen
        home: CustomSplash(
          initialRoute: AppPages.iNITIAL,
          imagePath: 'assets/images/logo/ROXN_Logo_red.png',
          backGroundColor: Colors.white,
          animationEffect: 'fade-in',
          logoSize: 70,
          duration: 2000,
          type: CustomSplashType.staticDuration,
        ),
      ),
    );
  }
}
// (GetStorage().read("firstTimeOpenApp") == null)
//               ? writeAndGetRoute()
//               : AppPages.mainPage