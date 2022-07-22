import 'package:flutter/material.dart';
import '../screens/homescreen/demo_page.dart';
import '../screens/homescreen/notifications.dart';
import '../screens/homescreen/taskpage.dart';
import '../style/colors.dart';
import 'custom_line_bar.dart';
import 'home_bottom_bar.dart';


class BottombarScaffold extends StatefulWidget {
  final PreferredSizeWidget appBar;
  final Widget body;

  const BottombarScaffold({Key? key, required this.body, required this.appBar})
      : super(key: key);

  @override
  State<BottombarScaffold> createState() => _BottombarScaffoldState();
}

class _BottombarScaffoldState extends State<BottombarScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: IndexedStack(
        index: 0,
        children: [
          widget.body,
          DemoPage(),
          NotificationPage(),
          TaskPage(),
        ],
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: colorGrey,

        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: 0,
        unselectedIconSize: 15,
        selectedIconSize: 20,
        onTap: (index) {
          if (index == 0) {
          } else {
            tabIndex = index;
            setState(() {});
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeBottomBar()));
          }
        },
        enableLineIndicator: false,
        lineIndicatorWidth: 0,
        indicatorType: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems(
              label: 'Home',
              nameImage: 'assets/svg/homescreen/android/home.svg'),
          CustomBottomBarItems(
              label: 'Demo',
              nameImage: 'assets/svg/homescreen/android/demo.svg'),
          CustomBottomBarItems(
              label: 'Notifications',
              nameImage: 'assets/svg/homescreen/android/notifications.svg'),
          CustomBottomBarItems(
            label: 'Tasks',
            nameImage: 'assets/svg/homescreen/android/task.svg',
          ),
        ],
      ),
    );
  }
}
