import 'package:ItemOptix/views/screens/homescreen/drawer/Diagnostics/feedback_page.dart';
import 'package:ItemOptix/views/screens/homescreen/home_page.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class DiagnosticsPage extends StatefulWidget {
  const DiagnosticsPage({Key? key}) : super(key: key);

  @override
  State<DiagnosticsPage> createState() => _DiagnosticsPageState();
}

class _DiagnosticsPageState extends State<DiagnosticsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Diagnostics',
            style: typoBalo18.copyWith(color: colorWhite),
          ),
        ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => _scaffoldKey1.currentState == null
                ? _scaffoldKey1.currentState!.openDrawer()
                : _scaffoldKey1.currentState!.isDrawerOpen
                ? _scaffoldKey1.currentState!.closeDrawer()
                : _scaffoldKey1.currentState!.openDrawer(),
            icon: Icon(Icons.menu),
          ),
        ),
        body: Scaffold(
          drawer: DrawerMenu(),
          key: _scaffoldKey1,
          onDrawerChanged: (_) {
            setState(() {});
          },
          body: ListView(
            children: [
              customItemVIew(title: "App Version", subtitle: "2.5.0 (68002)"),
              customItemVIew(
                  title: "Device ID", subtitle: "RFD8500-183055-2302-0229"),
              customItemVIew(title: "Site", subtitle: "R00001 (Store)"),
              customItemVIew(
                  title: "Feedback",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FeedbackScreen()));
                  },
                  image: 'assets/svg/homescreen/android/gren_right.svg'),
              customItemVIew(
                  title: "App Logs",
                  subtitle: "Last archived at Fri, 16 Apr 2021 11:23 AM",
                  subtitle2: "Pending: 2",
                  errorTitle:
                  "Last archived failed: <error desc: up to  lines>",
                  onTap: () {},
                  image: 'assets/svg/homescreen/android/app_logs.svg'),
            ],
          ),
        ));
  }

  customItemVIew(
      {required String title,
        String? subtitle,
        String? subtitle2,
        String? errorTitle,
        String? image,
        Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: transparent,
            border: Border(bottom: BorderSide(color: NeutralColors.n50))),
        margin: EdgeInsets.symmetric(vertical: Get.width * 0.01),
        padding: EdgeInsets.symmetric(
            vertical: Get.width * 0.02, horizontal: Get.width * 0.06),
        width: Get.width,
        child: GestureDetector(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: Get.width * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: Get.width * 0.6,
                          child: Text(
                            title,
                            maxLines: 2,
                            style:
                            typoBalo20.copyWith(color: NeutralColors.n90),
                          ),
                        ),
                        if (subtitle != null)
                          Container(
                            width: Get.width * 0.6,
                            margin: EdgeInsets.symmetric(
                                vertical: Get.width * 0.01),
                            child: Text(
                              subtitle,
                              style: typoRegular16.copyWith(color: NeutralColors.n90),
                            ),
                          ),
                        if (subtitle2 != null)
                          Container(
                            width: Get.width * 0.6,
                            margin: EdgeInsets.symmetric(
                                vertical: Get.width * 0.01),
                            child: Text(
                              subtitle2,
                              style: typoRegular16.copyWith(color: NeutralColors.n90),
                            ),
                          ),
                        if (errorTitle != null)
                          Container(
                            width: Get.width * 0.6,
                            margin: EdgeInsets.symmetric(
                                vertical: Get.width * 0.01),
                            child: Text(
                              errorTitle,
                              style: typoBold16.copyWith(
                                  color: NegativeColors.main),
                            ),
                          ),
                      ],
                    ),
                    if (onTap != null && image != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: SvgPicture.asset(image),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
