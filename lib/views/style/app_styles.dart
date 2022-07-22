import 'package:flutter/material.dart';
import 'colors.dart';

final boxShadow = [
  BoxShadow(
    color: colorBlack.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 10,
    offset: Offset(0, 0),
  ),
];

final popupboxShadow = [
  BoxShadow(
    color: colorBlack.withOpacity(3),
    spreadRadius: 2,
    blurRadius: 5,
    offset: Offset(0.1,0.1),
  ),
];

// for drawer
final boxShadowDrawer = [
  BoxShadow(
    color: colorGrey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 4,
    offset: Offset(0, 2), // changes position of shadow
  ),
];

final decoration = BoxDecoration(
  color: Colors.teal[500],
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

final decorationWhite = BoxDecoration(
  boxShadow: boxShadow,
  color: colorWhite,
  borderRadius: BorderRadius.all(Radius.circular(8)),
);
