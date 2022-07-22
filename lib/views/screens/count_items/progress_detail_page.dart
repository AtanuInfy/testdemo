import 'dart:math';

import 'package:ItemOptix/data/dummy_data.dart';
import 'package:ItemOptix/data/gen/assets.gen.dart';
import 'package:ItemOptix/views/screens/count_items/progress_page1.dart';
import 'package:ItemOptix/views/screens/homescreen/home_page.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/widgets/bottons.dart';
import 'package:ItemOptix/views/widgets/count_item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProgressDetailPage extends StatefulWidget {
  const ProgressDetailPage({Key? key}) : super(key: key);

  @override
  State<ProgressDetailPage> createState() => _ProgressDetailPageState();
}

class _ProgressDetailPageState extends State<ProgressDetailPage> {
  final pageController =
      PageController(initialPage: 0, viewportFraction: 1, keepPage: true);
  final PanelController _panelController = PanelController();
  TextStyle textStyle2 = TextStyle(
      color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w500);
  TextStyle textStyle1 = TextStyle(
      color: NeutralColors.n90, fontSize: 15.sp, fontWeight: FontWeight.w500);
  TextStyle textStyle3 = TextStyle(
      color: NeutralColors.n90, fontSize: 14.sp, fontWeight: FontWeight.w500);
  TextStyle textStyle4 = TextStyle(
      color: NeutralColors.n90, fontSize: 12.sp, fontWeight: FontWeight.w400);

  ScrollController controller = ScrollController();
  ScrollController scrollController = ScrollController();
  static const double padding = 24.0;
  bool isBarVisible = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    List<Widget> pages = [
      percentPage("75%", "Progress to Target"),
      percentPage("5,781", "Total Items Scanned"),
      percentPage("6573", "Count Target"),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 56.h,
        title: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: const Text("Count Items"),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Visibility(
              visible: !isBarVisible,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.settings))),
          SizedBox(width: 10.w),
          Visibility(
            visible: false,
            maintainState: true,
            maintainSize: true,
            maintainAnimation: true,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.edit_location_sharp)),
          ),
          SizedBox(width: 10.w),
          CommonTextButton(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              name: "SUBMIT"),
          SizedBox(
            width: 21.w,
          )
        ],
      ),
      body: Stack(
        children: [
          ProgressPageBody(pageController: pageController, pages: pages),
          Visibility(
            visible: isBarVisible,
            child: Positioned(
                left: 1, top: 0, child: TopNinearProgressbar(percent: 0.75)),
          ),
          SlidingUpPanel(
            controller: _panelController,
            onPanelOpened: () {
              isBarVisible = true;
              setState(() {});
              print("from opened $isBarVisible");
            },
            onPanelClosed: () {
              isBarVisible = false;
              setState(() {});
              print("from closed $isBarVisible");
            },
            minHeight: 60.h,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            // backdropEnabled: true,
            maxHeight: height - 200.h,
            defaultPanelState: PanelState.OPEN,
            // panelSnapping: false,
            // disableDraggableOnScrolling: true,
            // isDraggable: false,
            header: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: PrimaryColors.p600,
                size: 30.r,
              ),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ProgressPage1()));
                Navigator.pop(context);
              },
            ),
            panelBuilder: () => Column(
              // padding: EdgeInsets.all(16),
              children: [
                SizedBox(height: 14.h),
                Divider(
                  thickness: 4,
                  color: NeutralColors.n60,
                  indent: width / 2 - 22,
                  endIndent: width / 2 - 22,
                ),
                Visibility(
                    visible: isBarVisible, child: SizedBox(height: 15.h)),
                Visibility(
                    visible: isBarVisible, child: const Divider(thickness: 2)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 40.h,
                            width: width - 44.w,
                            padding: EdgeInsets.all(12.h),
                            decoration: const BoxDecoration(
                              color: PrimaryColors.p100,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            child:
                                Text("Short Puma Training", style: textStyle3),
                          ),
                          Container(
                            height: 100.h,
                            color: OtherColors.progressPageDetailTileBackground,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.s,
                              children: [
                                SizedBox(width: 5.w),
                                Assets.images.pumaShort1.image(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("SKU: 7628439577854",
                                        style: textStyle4),
                                    Text("Color: black", style: textStyle4),
                                    Text("Size: XS", style: textStyle4),
                                    Text("Category: something",
                                        style: textStyle4),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Column(
                        children: [
                          Container(
                            height: 40.h,
                            decoration: const BoxDecoration(
                              color: PrimaryColors.p100,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Expected", style: textStyle3),
                                const VerticalDivider(
                                    color: NeutralColors.n10, thickness: 1),
                                Text("Counted", style: textStyle3),
                                const VerticalDivider(
                                    color: NeutralColors.n10, thickness: 1),
                                Text("Difference", style: textStyle3),
                              ],
                            ),
                          ),
                          Container(
                            height: 40.h,
                            color: OtherColors.progressPageDetailTileBackground,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("4", style: textStyle3),
                                Text("1", style: textStyle3),
                                Text("3", style: textStyle3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

dragableDetail(
    {required BuildContext context,
    required int expected,
    required int counted,
    required int difference,
    required Color color}) {
  final TextStyle style = TextStyle(
      color: NeutralColors.n90, fontSize: 11.sp, fontWeight: FontWeight.w500);
  final double tileWidth = 100.w;
  return InkWell(
    onTap: () {
      print("bottomsheet tile tapped");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProgressDetailPage()));
    },
    child: Container(
      height: 35.h,
      color: OtherColors.progressPageDetailTileBackground,
      padding: EdgeInsets.only(left: 23.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: tileWidth, child: Text(expected.toString(), style: style)),
          SizedBox(
              width: tileWidth, child: Text(counted.toString(), style: style)),
          SizedBox(
              width: tileWidth,
              child: Text(difference.toString(), style: style)),
        ],
      ),
    ),
  );
}
