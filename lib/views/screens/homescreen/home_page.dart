import 'package:ItemOptix/data/models/home_model.dart';
import 'package:ItemOptix/views/screens/homescreen/scanner/fetch_data_popup.dart';
import 'package:ItemOptix/views/style/app_styles.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../count_items/question_dropdown.dart';
import 'drawer/Diagnostics/diagnostics_page.dart';
import 'drawer/about_popup.dart';
import 'drawer/devices/device_page.dart';
import 'drawer/signout_page.dart';
import 'drawer/sync_data.dart';
import 'homeitems/recieve_items_page.dart';
import 'homeitems/reserve_items_page.dart';
import 'homeitems/restock_items_page.dart';
import 'homeitems/search_items_page.dart';
import 'homeitems/ship_items_page.dart';
import 'homeitems/tag_items_page.dart';
import 'homeitems/track_items_page.dart';


String selectedDrawerItem = "";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isDevice = false;
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  final datas = [
    HomeModel(
      name: 'Tag Items',
      path: SvgPicture.asset(
        'assets/svg/homescreen/android/tag_items.svg',
        fit: BoxFit.fill,
      ),
      pageName: TagItemsPage(),
    ),
    HomeModel(
      name: 'Count Items',
      path: SvgPicture.asset(
        'assets/svg/homescreen/android/count_items.svg',
        fit: BoxFit.fill,
      ),
      pageName: QuestionDropdown(),
    ),
    HomeModel(
      name: 'Receive Items',
      path: SvgPicture.asset(
        'assets/svg/homescreen/android/receive_items.svg',
        fit: BoxFit.fill,
      ),
      pageName: RecieveItemsPage(),
    ),
    HomeModel(
      name: 'Search Items',
      path: SvgPicture.asset(
        'assets/svg/homescreen/android/search_items.svg',
        fit: BoxFit.fill,
      ),
      pageName: SearchItemsPage(),
    ),
    HomeModel(
      name: 'Restock Items',
      path: SvgPicture.asset(
        'assets/svg/homescreen/android/restock_items.svg',
        fit: BoxFit.fill,
      ),
      pageName: RestockItemsPage(),
    ),
    HomeModel(
      name: 'Track Items',
      path: SvgPicture.asset(
        'assets/svg/homescreen/android/track_items.svg',
        fit: BoxFit.fill,
      ),
      pageName: TrackItemsPage(),
    ),
    HomeModel(
      name: 'Reserve Items',
      path: SvgPicture.asset(
        'assets/svg/homescreen/android/reserve_items.svg',
        fit: BoxFit.fill,
      ),
      pageName: ReserveItemsPage(),
    ),
    HomeModel(
      name: 'Ship Items',
      path: SvgPicture.asset(
        'assets/svg/homescreen/android/ship_items.svg',
        fit: BoxFit.fill,
      ),
      pageName: ShipItemsPage(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0.h,
        title: Text(
          'Westfield 11001',
          style: typoBold18.copyWith(color: colorWhite),
        ),
        centerTitle: true,
        leading: Container(
          child: GestureDetector(
            onTap: () {
              selectedDrawerItem = "";
              setState(() {});
              _scaffoldKey1.currentState == null
                  ? _scaffoldKey1.currentState!.openDrawer()
                  : _scaffoldKey1.currentState!.isDrawerOpen
                  ? _scaffoldKey1.currentState!.closeDrawer()
                  : _scaffoldKey1.currentState!.openDrawer();
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(left: Get.width * 0.03),
                alignment: Alignment.center,
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: _scaffoldKey1.currentState == null
                        ? transparent
                        : _scaffoldKey1.currentState!.isDrawerOpen
                        ? PrimaryColors.p800
                        : transparent
                ),
                child: Icon(
                    Icons.menu),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FetchDataPopup();
                  },
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(
                      'assets/svg/homescreen/android/ic_trailling_home.svg'),
                )),
          )
        ],
      ),
      // endDrawerEnableOpenDragGesture: false,
      body: Scaffold(
        key: _scaffoldKey1,
        onDrawerChanged: (_) {
          setState(() {});
        },
        drawer: DrawerMenu(),
        body: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Center(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32,
                      crossAxisCount: 2,
                      childAspectRatio: 1.5),
                  padding: const EdgeInsets.all(16),
                  itemCount: datas.length,
                  itemBuilder: (context, index) => hometitles(
                    datas[index].name,
                    datas[index].path,
                    datas[index].pageName,
                  ))),
        ),
      ),
    );
  }

  hometitles(String name, Widget path, page) => GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: colorWhite,
        boxShadow: [
          BoxShadow(
            color: NeutralColors.n50,
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(
              2.0,
              2.0,
            ),
          )
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: path,
              width: 48,
              height: 48,
            ),
            Text(
              name,
              style: textItem,
            ),
          ],
        ),
      ),
    ),
  );
}

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
              ),
            ),
            // margin: EdgeInsets.only(top: Platform.isAndroid ? 105 : 104),
            child: Container(
              child: ListView(shrinkWrap: true, children: [
                Container(
                  width: Get.width * 0.8,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(left: 3),
                  decoration: BoxDecoration(
                      boxShadow: boxShadowDrawer, color: NeutralColors.n30),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 18,
                    children: [
                      SvgPicture.asset(
                          'assets/svg/homescreen/android/profile.svg'),
                      Text('Philip Fisher',
                          style:
                          typoBold16.copyWith(color: SecondaryColors.s700)),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.all(0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      customDrawerTile(
                            () {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AboutPopup();
                            },
                          );
                        },
                        "About",
                      ),
                      customDrawerTile(
                            () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DevicePage(),
                            ),
                          );
                        },
                        "Connect Devices",
                      ),
                      customDrawerTile(
                            () {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SyncDataPage();
                            },
                          );
                        },
                        "Sync Data",
                      ),
                      customDrawerTile(
                            () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DiagnosticsPage(),
                            ),
                          );
                        },
                        "Diagnostics",
                      ),
                      customDrawerTile(
                            () {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SignoutPage();
                            },
                          );
                        },
                        "Sign Out",
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // custom drawer tile
  customDrawerTile(Function() onTap, String title) {
    return GestureDetector(
      onTapDown: (_) {
        selectedDrawerItem = title;
        setState(() {});
      },
      onTapUp: (_) {
        onTap();
      },
      child: Container(
        height: Get.width * 0.15,
        width: Get.width * 0.8,
        margin: EdgeInsets.only(bottom: Get.width * 0.01),
        color: transparent,
        child: Row(
          children: [
            Container(
              width: 7,
              height: Get.width * 0.15,
              color:
              selectedDrawerItem == title ? PrimaryColors.p500 : colorWhite,
            ),
            SizedBox(
              width: Get.width * 0.03,
            ),
            Text(title,
                style: typoBold16.copyWith(
                    color: selectedDrawerItem == title
                        ? PrimaryColors.p500
                        : colorBlack)),
          ],
        ),
      ),
    );
  }
}