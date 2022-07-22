// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'dart:math' as math;

import 'package:ItemOptix/data/dummy_data.dart';
import 'package:ItemOptix/data/gen/assets.gen.dart';
import 'package:ItemOptix/data/l10n/locale_keys.g.dart';
import 'package:ItemOptix/services/channels/sdk_initialize.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ckp_plugin/flutter_ckp_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("page1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(LocaleKeys.help_txt_login_and_home).tr(),
            Text(LocaleKeys.common_title_print_success).tr(),
            Text(LocaleKeys.devices_txt_rfid_readers).tr(),
            Text(LocaleKeys.login_txt_welcome).tr(),
            Text(LocaleKeys.appsetup_title_module_title).tr(),
            Text(LocaleKeys.login_txt_login).tr(),
            AutoSizeText(LocaleKeys.login_txt_login.tr()),
            ElevatedButton(
                onPressed: () {
                  Get.to(Page2());
                },
                child: Text("next"))
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("page2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(LocaleKeys.help_txt_device_setup).tr(),
            Text(LocaleKeys.common_title_print_not_successful).tr(),
            Text(LocaleKeys.devices_txt_bluetooth_address).tr(),
            Text(LocaleKeys.collectorder_title_cancel_warning).tr(),
            Text(LocaleKeys.appsetup_title_setup_error).tr(),
            ElevatedButton(
                onPressed: () {
                  Get.to(Page3());
                },
                child: Text("next"))
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    final lanCodes = [
      "ar-AE",
      "cs-CZ",
      "de-DE",
      "es-ES",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("page3")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(LocaleKeys.help_txt_why_rfid).tr(),
            Text(LocaleKeys.common_txt_items).tr(),
            Text(LocaleKeys.devices_txt_bt_permission_denied).tr(),
            Text(LocaleKeys.login_title_session_expired).tr(),
            Text(LocaleKeys.appsetup_title_setup_error).tr(),
            ElevatedButton(
                onPressed: () {
                  GetStorage local = GetStorage();
                  var n = lanCodes[math.Random().nextInt(lanCodes.length)];
                  print("$n............................");
                  print(
                      "${context.deviceLocale.toString()}............................");
                  local.write("locale", n);

                  setState(() {
                    EasyLocalization.of(context)!
                        .setLocale(Locale(n.substring(0, 2), n.substring(3)));
                  });
                  Get.to(Page1());
                },
                child: Text("next"))
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    int mockHeight = 640;
    int mockwidth = 360;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final scale = mockwidth / width;
    final hscale = mockHeight / height;

    return PixelPerfect(
      scale: scale,
      assetPath: "assets/images/fullscreen.png",
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Center(
                child: Text("hey"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OverLa extends StatefulWidget {
  const OverLa({Key? key}) : super(key: key);

  @override
  _OverLaState createState() => _OverLaState();
}

class _OverLaState extends State<OverLa> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   showOverlay();
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    entry!.remove();
  }

  OverlayEntry? entry;
  LayerLink layLink = LayerLink();
  List dropdownItems1 = ["I'm counting by myself", "The team is counting"];
  List dropdownItems2 = ["location1", "location2", "location3", "location4"];
  List dropdownItems3 = ["I'm counting everything", "just sub-set of items"];
  showOverlay() {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    print(size);
    final offset = renderBox.localToGlobal(Offset.zero);
    print("$offset.........");
    entry = OverlayEntry(
      // opaque: true,
      builder: (context) => CompositedTransformFollower(
        link: layLink,
        child: Positioned(
          height: size.height * 0.5,
          width: size.height * 0.5,
          child: ElevatedButton(
            onPressed: (() {
              entry!.remove();
            }),
            child: FlutterLogo(
              size: 150,
            ),
          ),
        ),
      ),
    );
    overlay.insert(entry!);
  }

  buildOverlay() => Material(
      elevation: 8,
      child: Center(
        child: Column(
          children: [
            Text("text1"),
            Text("text2"),
            Text("text3"),
            Text("text4"),
            Container(color: Colors.black26),
          ],
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                cont(Colors.orange),
                cont(Colors.lime),
                cont(Colors.yellow),
                CompositedTransformTarget(
                  link: layLink,
                  child: InkWell(
                    onTap: () async {
                      showOverlay();
                      await Future.delayed(Duration(seconds: 2));
                      entry!.remove();
                    },
                    child: cont(Colors.green),
                  ),
                ),
                cont(Colors.blue),
                cont(Colors.orangeAccent),
                cont(Colors.greenAccent),
                // CustomBubble()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container cont(Color color) {
    return Container(
      height: 100,
      // width: 200,
      color: color,
    );
  }
}

class Dropd extends StatefulWidget {
  const Dropd({Key? key}) : super(key: key);

  @override
  State<Dropd> createState() => _DropdState();
}

class _DropdState extends State<Dropd> {
  List<String> dropdownItems1 = [
    "I'm counting by myself",
    "The team is counting"
  ];
  List dropdownItems2 = ["location1", "location2", "location3", "location4"];
  List dropdownItems3 = ["I'm counting everything", "just sub-set of items"];

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                items: dropdownItems2
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              // color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                hint: Text("Select"),
                value: selectedValue,
                searchInnerWidget: FlutterLogo(size: 50),
                offset: Offset(0, -6),

                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                    print("$value.............");
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 14,
                iconEnabledColor: Colors.yellow,
                iconDisabledColor: Colors.grey,
                buttonHeight: 50,
                buttonWidth: 200,
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  // color: Colors.redAccent,
                ),
                buttonElevation: 10,
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 200,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  // color: Colors.redAccent,
                ),
                // dropdownElevation: 16,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: false,
                // offset: const Offset(50, 0),
                // selectedItemBuilder: (_) {
                //   return dropdownItems2
                //       .map((e) => Text(
                //             e,
                //             style: TextStyle(color: PrimaryColors.p600),
                //           ))
                //       .toList();
                // },
                selectedItemHighlightColor: PrimaryColors.p600,
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              items: dropdownItems2
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            // color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              hint: Text("Select"),
              value: selectedValue,
              searchInnerWidget: FlutterLogo(size: 50),
              offset: Offset(0, -6),
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                  print("$value.............");
                });
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              selectedItemBuilder: (_) {
                return dropdownItems2
                    .map((e) => Text(
                          e,
                          style: TextStyle(color: PrimaryColors.p600),
                        ))
                    .toList();
              },
            ),
          ),
          // Dropd1()
        ],
      ),
    );
  }
}

class Dropd1 extends StatefulWidget {
  const Dropd1({Key? key}) : super(key: key);

  @override
  State<Dropd1> createState() => _Dropd1State();
}

class _Dropd1State extends State<Dropd1> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            buttonHeight: 40,
            buttonWidth: 140,
            itemHeight: 40,
            selectedItemHighlightColor: PrimaryColors.p600,
            selectedItemBuilder: (_) {
              return items
                  .map((e) => Text(
                        e,
                        style: TextStyle(color: PrimaryColors.p600),
                      ))
                  .toList();
            },
          ),
        ),
      ),
    );
  }
}

Column percentPage(String number, String descr) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        number,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: SecondaryColors.s900,
          fontSize: 36,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        descr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: SecondaryColors.s900,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
