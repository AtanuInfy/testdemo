// import 'package:flutter_ckp_plugin/flutter_ckp_plugin.dart';
// import 'package:flutter/services.dart';

// class Home {
//   Future<Map?> getDecodedResponseMap(String response) async {
//     var resMap;
//     try {
//       resMap = await FlutterCkpPlugin.registerDevices(response) ??
//           {'Status': 'Failed to get portal data through method channels'};
//     } on PlatformException {
//       resMap['Status'] = 'Failed to initialize the SDK';
//     }

//     return resMap as Map;
//   }
// }
