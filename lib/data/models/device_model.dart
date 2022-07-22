import 'package:flutter/material.dart';

class DeviceModel {
  final String name;
  final Widget path;
  bool isCollapse;
  DeviceModel(
      {required this.name, required this.path, required this.isCollapse});
}
