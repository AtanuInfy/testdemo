// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_ckp_plugin/flutter_ckp_plugin.dart';

// import '../../web_login/ui/web_view.dart';

// class Login {
//   static late String response;

//   void navigateAndDisplay(BuildContext context) async {
//     response = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const WebViewScreen()),
//     );

//     if (response != null && response.isNotEmpty) {
//       Navigator.of(context).pushReplacementNamed('home');
//     }
//   }

//   Future<String> getSDKReturnedValue() async {
//     String initStr;

//     try {
//       initStr =
//           await FlutterCkpPlugin.initSDK ?? 'Failed to initialize the SDK';
//     } on PlatformException {
//       initStr = 'Failed to initialize the SDK';
//     }

//     return initStr;
//   }

//   Future<String> getPlatformVersion() async {
//     String platformVersion;

//     try {
//       platformVersion =
//           await FlutterCkpPlugin.getBuildVersion ?? 'Unknown platform version';
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }

//     return platformVersion;
//   }
// }
