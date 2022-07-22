// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../application_logic/login.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String _platformVersion = 'Unknown';
//   String _sdkInit = 'Not Initialized';

//   final Login _login = Login();

//   @override
//   void initState() {
//     super.initState();
//     initSDK();
//     initPlatformVersion();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('ItemOptix'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('$_sdkInit\n\n'),
//               Text('Running on: $_platformVersion\n'),
//               ElevatedButton(
//                   onPressed: () {
//                     _login.navigateAndDisplay(context);
//                   },
//                   child: const Text("Login"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void initSDK() async {
//     _sdkInit = await _login.getSDKReturnedValue();
//     setState(() {});
//   }

//   void initPlatformVersion() async {
//     _platformVersion = await _login.getPlatformVersion();
//     setState(() {});
//   }
// }
