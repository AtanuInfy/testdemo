import 'package:ItemOptix/data/l10n/locale_keys.g.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundBotton extends StatelessWidget {
  final String bottonName;
  final Function() onPress;
  const RoundBotton({Key? key, required this.bottonName, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: AutoSizeText(
        bottonName,
        style: const TextStyle(
          // fontSize: 15,
          color: Colors.white,
        ),
        maxFontSize: 15,
      ),
    );
  }
}

class LoginBotton extends StatelessWidget {
  final Function() onPress;
  const LoginBotton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String login = LocaleKeys.login_txt_login.tr();
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: AutoSizeText(
        login,
        style: TextStyle(
          fontSize: (login.length >= 8) ? 10 : null,
          color: Colors.white,
        ),
        maxFontSize: 15,
      ),
    );
  }
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
            ),
          ),
        ),
      ),
    );
  }

  // static commonTextButton(
  //         {required String name, required VoidCallback onPress}) =>
  //     CommonTextButton();
}

class CommonTextButton extends StatelessWidget {
  final String name;
  final VoidCallback onPress;
  const CommonTextButton({
    Key? key,
    required this.name,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // style: ButtonStyle(
      //   fixedSize: MaterialStateProperty.all<Size>(
      //     // width : double.maxFinite
      //     // height: 56.0
      //     Size(40.w, 10.h),
      //   ),
      //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,

      //   // fill color
      //   backgroundColor: MaterialStateProperty.all<Color>(
      //     NeutralColors.n100,
      //   ),
      // ),
      onPressed: onPress,
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
