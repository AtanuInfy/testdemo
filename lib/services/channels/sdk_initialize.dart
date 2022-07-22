import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


class SDKInitialize {
  static const MethodChannel _channel =
      MethodChannel('plugins.flutter.checkpt_itemoptix');

  static Future<String?> get initSDK async {
    print("initSDK");
    try {
      final String? version = await _channel.invokeMethod('ItemOptix_initSDK');
      return version;
    } on PlatformException catch (e) {
      String errorMessage = 'Failed to get platform version: \n${e.message}';
      debugPrint(errorMessage);
    }
    return null;
  }

  static Future<String?> get getBuildVersion async {
    final String? version =
        await _channel.invokeMethod('ItemOptix_getBuildVersion');
    return version;
  }

  static Future registerDevices(String payLoad) async {
    print("registerDevices");
    try {
      var map = await _channel.invokeMethod(
          'PortalUserManager_registerDevices', payLoad);
      return map;
    } on PlatformException catch (e) {
      String errorMessage = 'Failed to get platform version: \n${e.message}';
      debugPrint(errorMessage);
    }
    return null;
  }

  static Future<String?> get getPortalURL async {
    print("getPortalURL");
    try {
      final String? version =
          await _channel.invokeMethod('PortalUserManager_getPortalURL');
      return version;
    } on PlatformException catch (e) {
      String errorMessage = 'Failed to get platform version: \n${e.message}';
      debugPrint(errorMessage);
    }
    return null;
  }
}
