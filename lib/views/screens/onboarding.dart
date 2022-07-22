import 'dart:convert';
import 'package:ItemOptix/data/l10n/locale_keys.g.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_ckp_plugin/flutter_ckp_plugin.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';
import 'webview_login.dart';
import '../widgets/bottons.dart';
import '../widgets/onboarding_widgets.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    FlutterCkpPlugin.initSDK;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;
    GetStorage setupData = GetStorage();
    String _isSetupComplete = setupData.read('isSetupComplete') ?? "false";
    String url = setupData.read("url") ?? "";
    const String defaultURL =
        "https://halo.checkpointsystems.com/r/halo/user/login/?mobile=true";

    Future scanQR() async {
      String qrScanner;
      try {
        qrScanner = await FlutterBarcodeScanner.scanBarcode(
            "#ff6666", LocaleKeys.common_txt_cancel.tr(), true, ScanMode.QR);
        if (qrScanner.contains('url')) {
          var qrScan = jsonDecode(qrScanner);
          url = "${qrScan['url']}?mobile=true";
          setupData.write("url", url);
          setupData.write("isSetupComplete", "true");
          setState(() {
            _isSetupComplete = setupData.read("isSetupComplete");
          });
        } else if (qrScanner == "-1") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Cancelled\nPlease scan QR code again"),
              backgroundColor: NoticeColors.main,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "Invalid QR Code, Please scan QR code again\nScanned code: $qrScanner"),
              backgroundColor: NegativeColors.main,
            ),
          );
        }
      } on PlatformException catch (e) {
        qrScanner = 'Failed to get platform version.\n${e.message}';
      }
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                gradient: LightThemeItemOptix.linearGradient,
              ),
            ),
            const Lines(),
            OnboardWidget(
              left: width * 6.7,
              top: height * 8,
              height: height * 5,
              width: width * 86.7,
              filePath: "assets/svg/onboarding/item_optix.svg",
            ),
            Welcome(
              left: width * 9.5,
              top: height * 33.5,
              height: height * 17.1,
              width: width * 81.15,
            ),
            OnboardWidget(
              left: width * 6.7,
              bottom: height * 6.3,
              height: height * 21.3,
              width: width * 60,
              filePath: "assets/svg/onboarding/halo_logo.svg",
            ),
            CircleDots(
              height: height * 28,
              width: width * 25,
            ),
            (_isSetupComplete == "true")
                ? Positioned(
                    left: width * 37.78,
                    bottom: height * 35,
                    height: height * 5,
                    width: width * 24,
                    child: LoginBotton(
                      onPress: () {
                        Get.to(() => WebViewLogin(url: url));
                      },
                    ),
                  )
                : Positioned(
                    left: width * 20,
                    bottom: height * 35,
                    height: height * 6,
                    width: width * 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RoundBotton(
                          bottonName: LocaleKeys.appsetup_txt_skip.tr(),
                          onPress: () {
                            setState(() {
                              url = defaultURL;
                              setupData.write("isSetupComplete", "true");
                              setupData.write("url", defaultURL);
                              _isSetupComplete =
                                  setupData.read("isSetupComplete");
                            });
                          },
                        ),
                        RoundBotton(
                          bottonName: LocaleKeys.appsetup_txt_next.tr(),
                          onPress: () {
                            scanQR();
                          },
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
