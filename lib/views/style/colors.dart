import 'package:flutter/material.dart';

const colorTransparent = Color(0x00000000);
const transparent = Colors.transparent;
const colorWhite = Color(0xffffffff);
const colorBlack = Color(0xff000000);
const colorGrey = Colors.grey;
const colorGreyBlue = Color(0xff2E5970);
const colorSecondBlue = Color(0xff0C398D);
const colorPrimaryBlue = Color(0xFF008B8B);
const colorNeutralGray100 = Color(0xff191B28);
const colorNeutralGray90 = Color(0xff30323E);
const colorNeutralGray60 = Color(0xff75767E);
const colorNeutralGray50 = Color(0xffC2C2C2);
const colorNeutralGray15 = Color(0xff80a7a3a7);
const colorTextHome = Color(0xff303133);
const lightGreenBack = Color(0xB3DFE226);

class PositiveColors {
  static const Color main = Color(0xFF008B8B);
  static const Color surface = Color(0xFFB3DFE2);
  static const Color border = Color(0xFF4EB7BB);
  static const Color pressed = Color(0xFF084F4B);
}

class NegativeColors {
  static const Color main = Color(0xFFDB1F22);
  static const Color surface = Color(0xFFFFEDED);
  static const Color border = Color(0xFFF3D1D1);
  static const Color pressed = Color(0xFF780709);
}

class NoticeColors {
  static const Color main = Color(0xFFDB6A00);
  static const Color surface = Color(0xFFFFF4EF);
  static const Color border = Color(0xFFF2DDC9);
  static const Color pressed = Color(0xFF780A00);
}

class InformativeColors {
  static const Color main = Color(0xFF48A0DF);
  static const Color surface = Color(0xFFE3F1FA);
  static const Color border = Color(0xFF2284CE);
  static const Color pressed = Color(0xFF002E5C);
}

class OtherColors {
  static const Color shadow = Color(0xFFFFFFFF);
  static const Color scafoldBackground = Color(0xFFF7F7F7);
  static const Color progressPageDetailTileBackground = Color(0xFFF4FAFB);
  static const progressBarLinearGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF045D8E),
      Color(0xFF36DAD0),
    ],
  );
}

class NeutralColors {
  static const n10 = Color(0xFFFFFFFF);
  static const n20 = Color(0xFFF5F5F5);
  static const n30 = Color(0xFFEDEDED);
  static const n40 = Color(0xFFE0E0E0);
  static const n50 = Color(0xFFC2C2C2);
  static const n60 = Color(0xFF9E9E9E);
  static const n70 = Color(0xFF757575);
  static const n80 = Color(0xFF616161);
  static const n90 = Color(0xFF404040);
  static const n100 = Color(0xFF0A0A0A);
}

class ListColors {
  static const darkRow = Color(0xFFD9EFF1);
  static const lightRow = Color(0xFFF0F9F9);
}

class PrimaryColors {
  static const p50 = Color(0xFFE1F2F4);
  static const p100 = Color(0xFFB3DFE2);
  static const p200 = Color(0xFF82CCD0);
  static const p300 = Color(0xFF4EB7BB);
  static const p400 = Color(0xFF26A8AB);
  static const p500 = Color(0xFF009899);
  static const p600 = Color(0xFF008B8B);
  static const p700 = Color(0xFF027B7A);
  static const p800 = Color(0xFF066B69);
  static const p900 = Color(0xFF084F4B);
  static const p1000 = Color(0xFF052E2C);
}

class SecondaryColors {
  static const s50 = Color(0xFFE3F1FA);
  static const s100 = Color(0xFFBADCF3);
  static const s200 = Color(0xFF90C7EC);
  static const s300 = Color(0xFF67B1E3);
  static const s400 = Color(0xFF48A0DF);
  static const s500 = Color(0xFF2A91DA);
  static const s600 = Color(0xFF2284CE);
  static const s700 = Color(0xFF1873BC);
  static const s800 = Color(0xFF1062AA);
  static const s900 = Color(0xFF00468B);
  static const s1000 = Color(0xFF002E5C);
}
// TODO write PrimaryDark and SecondaryDark colors