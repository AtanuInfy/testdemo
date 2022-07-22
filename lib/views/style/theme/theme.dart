import 'package:ItemOptix/views/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightThemeItemOptix {
  static const statusBarColor = Color(0xFF002E5C);

  static const linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF36DAD0), Color(0xFF045D8E)],
  );

  static MaterialColor primary = const MaterialColor(0xFF052E2C, {
    50: Color(0xFFE1F2F4),
    100: Color(0xFFB3DFE2),
    200: Color(0xFF82CCD0),
    300: Color(0xFF4EB7BB),
    400: Color(0xFF26A8AB),
    500: Color(0xFF009899),
    600: Color(0xFF008B8B),
    700: Color(0xFF027B7A),
    800: Color(0xFF066B69),
    900: Color(0xFF084F4B)
  });
  static MaterialColor secondary = const MaterialColor(0xFF002E5C, {
    50: Color(0xFFE3F1FA),
    100: Color(0xFFB3DFE2),
    200: Color(0xFF82CCD0),
    300: Color(0xFF4EB7BB),
    400: Color(0xFF26A8AB),
    500: Color(0xFF009899),
    600: Color(0xFF008B8B),
    700: Color(0xFF027B7A),
    800: Color(0xFF066B69),
    900: Color(0xFF00468B)
  });
}

class DarkThemeItemOptix {
  static const statusBarColor = Color(0xFF005555);
  static const linearGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFF4E944F),
      Color(0xFF83BDFF),
    ],
  );

  static MaterialColor primary = const MaterialColor(0xFF052E2C, {
    50: Color(0xFFE1F2F4),
    100: Color(0xFFB3DFE2),
    200: Color(0xFF82CCD0),
    300: Color(0xFF4EB7BB),
    400: Color(0xFF26A8AB),
    500: Color(0xFF009899),
    600: Color(0xFF008B8B),
    700: Color(0xFF027B7A),
    800: Color(0xFF066B69),
    900: Color(0xFF084F4B)
  });
  static MaterialColor secondary = const MaterialColor(0xFF002E5C, {
    50: Color(0xFFE3F1FA),
    100: Color(0xFFB3DFE2),
    200: Color(0xFF82CCD0),
    300: Color(0xFF4EB7BB),
    400: Color(0xFF26A8AB),
    500: Color(0xFF009899),
    600: Color(0xFF008B8B),
    700: Color(0xFF027B7A),
    800: Color(0xFF066B69),
    900: Color(0xFF00468B)
  });
}

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: PrimaryColors.p600),
      primaryColor: PrimaryColors.p600,
      // colorSchemeSeed: PrimaryColors.p600,
      backgroundColor: NeutralColors.n10,
      splashColor: PrimaryColors.p900,

      scaffoldBackgroundColor: OtherColors.scafoldBackground,
      // fontFamily: Platform.isAndroid ? 'Roboto' : 'San Francisco',
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.sp),
        ),
        buttonColor: Colors.lightBlue,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: PrimaryColors.p600,
          onSurface: PrimaryColors.p50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // primary: PrimaryColors.p600,
          onSurface: PrimaryColors.p50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
        ),
      ),

      // textTheme: TextTheme(
      //   bodyText2: TextStyle(
      //     color: NeutralColors.n90,
      //     fontSize: 16.sp,
      //     fontWeight: FontWeight.w500,
      //   ),
      //   bodyText1: TextStyle(
      //     color: NeutralColors.n90,
      //     fontSize: 16.sp,
      //     fontWeight: FontWeight.w500,
      //   ),
      // ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme:
          const AppBarTheme(backgroundColor: DarkThemeItemOptix.statusBarColor),
      primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.transparent,
      // fontFamily: Platform.isAndroid ? 'Roboto' : 'San Francisco',
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        buttonColor: Colors.white,
      ),
    );
  }
}
