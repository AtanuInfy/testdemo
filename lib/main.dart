import 'package:ItemOptix/services/storage_services.dart';
import 'package:ItemOptix/views/screens/onboarding.dart';
import 'package:ItemOptix/views/widgets/home_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:ItemOptix/data/constants.dart';
import 'views/style/theme/theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  runApp(
    EasyLocalization(
      supportedLocales: countryCodes(),
      path: "assets/l10n",
      fallbackLocale: const Locale("en", "US"),
      // assetLoader: ,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StorageServices store = StorageServices();
    return ScreenUtilInit(
      designSize: const Size(360,640),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: store.getlocale(context),
          debugShowCheckedModeBanner: false,
          title: 'ItemOptix',
          themeMode: ThemeMode.system,
          theme: CustomTheme.lightTheme,
          // darkTheme: CustomTheme.darkTheme,
          // home:Onboarding(),
          home:HomeBottomBar(),
        );
      },
    );
  }
}
