import 'package:flutter/material.dart';

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

class CustomWidget {
  static Widget outlinedButtonWhite(text, VoidCallback? onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return LightThemeItemOptix.primary;
          }
          return Colors.transparent; // Defer to the widget's default.
        }),
        enableFeedback: true,
        alignment: Alignment.center,
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.fromLTRB(20, 8, 20, 8)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(
                color: Colors.white,
                width: 1,
              )),
        ),
      ),
    );
  }
}

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: LightThemeItemOptix.statusBarColor),
      primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.transparent,
      // fontFamily: Platform.isAndroid ? 'Roboto' : 'San Francisco',
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        buttonColor: Colors.lightBlue,
      ),
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
