// import 'package:ItemOptix/modules/home/application_logic/home.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key, required this.response}) : super(key: key);
//   String response;

//   @override
//   State<HomePage> createState() => _HomePageState(responseStr: response);
// }

// class _HomePageState extends State<HomePage> {
//   _HomePageState({required this.responseStr});

//   Map? responseMap;
//   Home home = Home();
//   String responseStr;

//   @override
//   void initState() {
//     initResponseMap();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Map responseMap = response as Map;

//     return Scaffold(
//         body: responseMap != null
//             ? Center(
//                 child: Container(
//                     child: ListView.builder(
//                 itemCount: responseMap?.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   String key = responseMap?.keys.elementAt(index);
//                   return Column(
//                     children: <Widget>[
//                       ListTile(
//                         title: Text(key),
//                         subtitle: Text("${responseMap?[key]}"),
//                       ),
//                       const Divider(
//                         height: 2.0,
//                       ),
//                     ],
//                   );
//                 },
//               )))
//             : Container(
//                 child: const Center(
//                     child: SizedBox(
//                   height: 30,
//                   width: 30,
//                   child: CircularProgressIndicator(),
//                 )),
//               ));
//   }

//   void initResponseMap() async {
//     responseMap = await home.getDecodedResponseMap(responseStr);
//     setState(() {});
//   }
// }
