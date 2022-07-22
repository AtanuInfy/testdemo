import 'package:ItemOptix/modules/theme_itemoptix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AppSetup extends StatefulWidget {
  const AppSetup({Key? key}) : super(key: key);

  @override
  State<AppSetup> createState() => _AppSetupState();
}

class _AppSetupState extends State<AppSetup> {
  var _setupCompleted = false;

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 3,
        ),
        body: Stack(children: [
          Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(34, 160, 34, 0),
              child: Column(
                children: const [
                  Text(
                    "Welcome!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        // height: 1.2,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Login to start managing your inventory better using RFID!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        // height: 1.4,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 280),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: (_setupCompleted)
                  ? [
                      CustomWidget.outlinedButtonWhite("Login", () {}),
                    ]
                  : [
                      CustomWidget.outlinedButtonWhite("Skip", () {
                        setState(() {
                          _setupCompleted = true;
                        });
                      }),
                      CustomWidget.outlinedButtonWhite("Next", () {
                        setState(() {
                          _setupCompleted = true;
                        });
                      }),
                    ],
            ),
          ),
          Positioned(
            left: -56,
            top: -10,
            child: SvgPicture.asset(
              "images/circle_lines.svg",
              width: 181.12,
              height: 181,
              color: Colors.white24,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(20, 58, 20, 0),
            child: SvgPicture.asset(
              "images/itemoptix_header.svg",
              width: 250,
              height: 32.72,
              color: Colors.white,
            ),
          ),
          Positioned(
            right: -18,
            bottom: 34,
            child: SvgPicture.asset(
              "images/circle_dots.svg",
              height: 217,
              width: 112.5,
              color: Colors.white38,
            ),
          ),
          Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(34, 0, 0, 34),
                  child: SvgPicture.asset(
                    "images/halo_logo.svg",
                    height: 136,
                    width: 217,
                    color: Colors.white,
                  )))
        ]));
    return Container(
      decoration:
          const BoxDecoration(gradient: LightThemeItemOptix.linearGradient),
      child: scaffold,
    );
  }
}
