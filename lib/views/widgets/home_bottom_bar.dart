import 'package:ItemOptix/data/gen/assets.gen.dart';
import 'package:ItemOptix/views/screens/homescreen/demo_page.dart';
import 'package:ItemOptix/views/screens/homescreen/home_page.dart';
import 'package:ItemOptix/views/screens/homescreen/notifications.dart';
import 'package:ItemOptix/views/screens/homescreen/taskpage.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

var tabIndex = 0;

class HomeBottomBar extends StatefulWidget {
  HomeBottomBar({Key? key}) : super(key: key);

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return const [
      HomePage(),
      DemoPage(),
      NotificationPage(),
      TaskPage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Assets.svg.homescreen.android.home.svg(),
        inactiveIcon:
            Assets.svg.homescreen.android.home.svg(color: NeutralColors.n50),

        title: ("Home"),
        activeColorPrimary: PrimaryColors.p600,
        // activeColorSecondary: PrimaryColors.p600,
        inactiveColorPrimary: NeutralColors.n50,
        inactiveColorSecondary: NeutralColors.n50,
        textStyle: TextStyle(
          fontSize: 12.sp,
          color: NeutralColors.n50,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Assets.svg.homescreen.android.demo.svg(color: PrimaryColors.p600),
        inactiveIcon:
            Assets.svg.homescreen.android.demo.svg(color: NeutralColors.n50),

        title: ("Demo"),
        activeColorPrimary: PrimaryColors.p600,
        // activeColorSecondary: PrimaryColors.p600,
        inactiveColorPrimary: NeutralColors.n50,
        inactiveColorSecondary: NeutralColors.n50,
        textStyle: TextStyle(
          fontSize: 12.sp,
          color: NeutralColors.n50,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Assets.svg.homescreen.android.notifications
            .svg(color: PrimaryColors.p600),
        inactiveIcon: Assets.svg.homescreen.android.notifications
            .svg(color: NeutralColors.n50),

        title: ("Notifications"),
        activeColorPrimary: PrimaryColors.p600,
        // activeColorSecondary: PrimaryColors.p600,
        inactiveColorPrimary: NeutralColors.n50,
        inactiveColorSecondary: NeutralColors.n50,
        textStyle: TextStyle(
          fontSize: 12.sp,
          color: NeutralColors.n50,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Assets.svg.homescreen.android.task.svg(color: PrimaryColors.p600),
        inactiveIcon:
            Assets.svg.homescreen.android.task.svg(color: NeutralColors.n50),

        title: ("Task"),
        activeColorPrimary: PrimaryColors.p600,
        // activeColorSecondary: PrimaryColors.p600,
        inactiveColorPrimary: NeutralColors.n50,
        inactiveColorSecondary: NeutralColors.n50,
        textStyle: TextStyle(
          fontSize: 12.sp,
          color: NeutralColors.n50,
        ),
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),

      confineInSafeArea: true,
      navBarHeight: 56.h,
      backgroundColor: NeutralColors.n10, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          false, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: NeutralColors.n10,
      ),

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
