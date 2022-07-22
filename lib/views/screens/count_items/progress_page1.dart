import 'dart:math';

import 'package:ItemOptix/data/dummy_data.dart';
import 'package:ItemOptix/data/gen/assets.gen.dart';
import 'package:ItemOptix/views/screens/count_items/progress_page2.dart';
import 'package:ItemOptix/views/screens/homescreen/home_page.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/widgets/bottons.dart';
import 'package:ItemOptix/views/widgets/count_item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProgressPage1 extends StatefulWidget {
  const ProgressPage1({Key? key}) : super(key: key);

  @override
  State<ProgressPage1> createState() => _ProgressPage1State();
}

class _ProgressPage1State extends State<ProgressPage1> {
  final pageController =
      PageController(initialPage: 0, viewportFraction: 1, keepPage: true);
  final PanelController _panelController = PanelController();
  TextStyle textStyle2 = TextStyle(
      color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w500);
  TextStyle textStyle1 = TextStyle(
      color: NeutralColors.n90, fontSize: 15.sp, fontWeight: FontWeight.w500);

  ScrollController controller = ScrollController();
  ScrollController scrollController = ScrollController();
  static const double padding = 24.0;
  bool isBarVisible = false;

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
          Align(
            alignment: Alignment.topCenter,
            child:
                ProgressPageBody(pageController: pageController, pages: pages),
          ),
          Visibility(
            visible: isBarVisible,
            child: Positioned(
              left: 1,
              top: 0,
              child: TopNinearProgressbar(
                percent: 0.75,
              ),
            ),
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
            // panelSnapping: false,
            // disableDraggableOnScrolling: true,
            // isDraggable: false,
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
                  child: Container(
                    height: 40.h,
                    decoration: const BoxDecoration(
                      color: PrimaryColors.p600,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Department", style: textStyle2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Assets.svg.countItems.switchVertical.svg(
                              color: Colors.white,
                              allowDrawingOutsideViewBox: true,
                            ),
                            const VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                              // width: 20,
                            ),
                            Text("Counted", style: textStyle2),
                            const SizedBox(width: 30),
                            Assets.svg.countItems.switchVertical.svg(
                              color: Colors.white,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: padding),
                    child: ListView.builder(
                      controller: controller,
                      shrinkWrap: true,
                      itemCount: CountItemData.listTile1.length,
                      itemBuilder: (context, index) {
                        return dragList1(
                            context,
                            CountItemData.listTile1[index],
                            Random().nextInt(99),
                            (index % 2) == 0
                                ? ListColors.lightRow
                                : ListColors.darkRow);
                      },
                    ),
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

class TopNinearProgressbar extends StatelessWidget {
  final double percent;
  TopNinearProgressbar({
    Key? key,
    required this.percent,
  }) : super(key: key);
  final TextStyle textStyle1 = TextStyle(
      color: NeutralColors.n90, fontSize: 15.sp, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 28.w, top: 15.h),
      color: OtherColors.scafoldBackground,
      height: 150,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("5781 Total Items Scanned", style: textStyle1),
              SizedBox(width: 84.w),
              Text("75%", style: textStyle1),
            ],
          ),
          SizedBox(height: 4.h),
          LinearPercentIndicator(
            width: width - 56.w,
            padding: EdgeInsets.zero,
            lineHeight: 27.h,
            percent: percent,
            linearGradient: OtherColors.progressBarLinearGradient,
            backgroundColor: NeutralColors.n30,
            barRadius: const Radius.circular(16),
          ),
        ],
      ),
    );
  }
}

class ProgressPageBody extends StatelessWidget {
  const ProgressPageBody({
    Key? key,
    required this.pageController,
    required this.pages,
  }) : super(key: key);

  final PageController pageController;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle1 = TextStyle(
        color: NeutralColors.n90, fontSize: 15.sp, fontWeight: FontWeight.w500);
    final bodyContentPadding = 28.0.w;
    final dividerSize = 2.0.h;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyContentPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CuRow(
                child: Assets.svg.countItems.outlineAdjustments.svg(),
                name: "Womanswear",
              ),
              const CuRow(
                child: Icon(
                  Icons.groups,
                  color: SecondaryColors.s900,
                ),
                name: "Team members: 5",
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyContentPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CuRow(
                child: Assets.svg.countItems.mapsRounded.svg(),
                name: "Location: 3",
              ),
              const Visibility(
                visible: false,
                maintainState: true,
                maintainSize: true,
                maintainAnimation: true,
                child: CuRow(
                  child: Icon(
                    Icons.cloud_upload,
                    color: NoticeColors.main,
                  ),
                  name: "Pending Upload",
                  color: NoticeColors.main,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(thickness: dividerSize),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: bodyContentPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Count target: 6573", style: textStyle1),
                  Text("Site stock total: 10320", style: textStyle1),
                ],
              ),
            ),
            Divider(thickness: dividerSize),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: bodyContentPadding),
              child: Text("Items scanned in other locations: 324",
                  style: textStyle1),
            ),
            Divider(thickness: dividerSize),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: bodyContentPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CuSwitch(
                      child: Switch(
                          activeColor: SecondaryColors.s500,
                          activeTrackColor: SecondaryColors.s200,
                          value: true,
                          onChanged: (_) {}),
                      name: "Triggerless mode",
                      onPress: () {}),
                  Text("Your count: 4939", style: textStyle1),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // SizedBox(height: 25.h),
            CircularPercentIndicator(
              arcBackgroundColor: NeutralColors.n30,
              arcType: ArcType.FULL,
              radius: 120.r,
              animation: true,
              animationDuration: 1000,
              lineWidth: 15.r,
              // startAngle: 210,
              linearGradient: OtherColors.progressBarLinearGradient,
              backgroundColor: NeutralColors.n30,
              percent: 0.95,
              center: PageView(
                // physics: ClampingScrollPhysics(),
                controller: pageController,
                children: pages,
              ),

              widgetIndicator: RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.horizontal_rule_rounded,
                  color: PrimaryColors.p600,
                  size: 50.r,
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -40),
              child: SmoothPageIndicator(
                controller: pageController,
                count: pages.length,
                effect: ScrollingDotsEffect(
                  activeDotScale: 1,
                  maxVisibleDots: 5,
                  radius: 8.17.r,
                  spacing: 14.w,
                  // dotHeight: 12,
                  // dotWidth: 12,
                  dotColor: SecondaryColors.s100,
                  activeDotColor: SecondaryColors.s400,
                ),
              ),
            ),
            // SizedBox(height: 40.h)
          ],
        ),
      ],
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

dragList1(BuildContext context, String department, int percent, Color color) {
  final TextStyle style = TextStyle(
    color: NeutralColors.n90,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  return InkWell(
    onTap: () {
      print("bottomsheet tile tapped");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProgressPage2()));
    },
    child: Container(
      height: 35.h,
      color: color,
      padding: EdgeInsets.only(left: 23.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(department, style: style),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("$percent%", style: style),
              SizedBox(width: 30.w),
              Icon(
                Icons.chevron_right,
                size: 25.r,
                color: NeutralColors.n90,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
