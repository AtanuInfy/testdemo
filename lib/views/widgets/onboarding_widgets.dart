import 'package:ItemOptix/data/l10n/locale_keys.g.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Lines extends StatelessWidget {
  const Lines({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 0.0,
      child: Image(
        image: AssetImage("assets/images/lines.png"),
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

class OnboardWidget extends StatelessWidget {
  final double? bottom;
  final String filePath;
  final double? height;
  final double? left;
  final double? right;
  final double? top;
  final double? width;
  const OnboardWidget({
    Key? key,
    this.bottom,
    required this.filePath,
    this.height,
    this.left,
    this.right,
    this.top,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      height: height,
      width: width,
      child: SvgPicture.asset(
        filePath,
      ),
    );
  }
}

class CircleDots extends StatelessWidget {
  final double height, width;
  const CircleDots({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 34,
      child: SvgPicture.asset(
        "assets/svg/onboarding/circle_dots.svg",
        height: height,
        width: width,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  final double left, top, height, width;
  const Welcome(
      {Key? key,
      required this.left,
      required this.top,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            LocaleKeys.login_txt_welcome.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            maxFontSize: 30,
          ),
          const SizedBox(height: 10),
          AutoSizeText(
            LocaleKeys.login_txt_login_to_start.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            maxFontSize: 21,
          ),
        ],
      ),
    );
  }
}
