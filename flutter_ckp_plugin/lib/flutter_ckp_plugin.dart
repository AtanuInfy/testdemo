import 'dart:async';
// import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:flutter_ckp_plugin/method_constants.dart';

class FlutterCkpPlugin {
  static const MethodChannel _channel =
      MethodChannel('plugins.flutter.checkpt/itemoptix');

  static Future<bool> get initSDK async {
    final bool initialised =
        await _channel.invokeMethod(MethodConstants.initSDK);
    return initialised;
  }

  static Future<String> get getBuildVersion async {
    final String version =
        await _channel.invokeMethod(MethodConstants.getVersion);
    return version;
  }

  static Future<Map> registerDevices(String payLoad) async {
    var map =
        await _channel.invokeMethod(MethodConstants.registerDevice, payLoad);
    return map;
  }
}
