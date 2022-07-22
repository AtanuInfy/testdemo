import 'package:ItemOptix/data/dummy_data.dart';
import 'package:ItemOptix/views/screens/count_items/standard_filters.dart';
import 'package:ItemOptix/views/widgets/bottons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ItemOptix/views/widgets/count_item_widgets.dart';


class QuestionDropdown extends StatefulWidget {
  const QuestionDropdown({Key? key}) : super(key: key);

  @override
  State<QuestionDropdown> createState() => _QuestionDropdownState();
}

class _QuestionDropdownState extends State<QuestionDropdown> {
  bool isCountScreen = false;

  @override
  Widget build(BuildContext context) {
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
          CommonTextButton(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StandardFilters(),
                  ),
                );
                // setState(() {
                //   // isCountScreen = !isCountScreen;
                //   Get.to(() => StandardFilters());
                // });
              },
              name: "NEXT"),
          SizedBox(
            width: 21.w,
          )
        ],
      ),
      // bottomNavigationBar: HomeBottomBar(),
      body: countSelection(CountItemData.dropdownItems1,
          CountItemData.dropdownItems2, CountItemData.dropdownItems3),
    );
  }
}

Padding countSelection(List<dynamic> dropdownItems1,
    List<dynamic> dropdownItems2, List<dynamic> dropdownItems3) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 42.h),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CountItemPageTitle(
            title: "A few questions before you start...",
            height: 82.h,
            width: 300.w),
        SizedBox(height: 20.h),
        const CuDropDownTitle(title: "Are you counting with someone else?"),
        CuDropDown(dropdownItems: dropdownItems1),
        SizedBox(height: 20.h),
        const CuDropDownTitle(title: "What location are you counting?"),
        CuDropDown(dropdownItems: dropdownItems2),
        SizedBox(height: 20.h),
        const CuDropDownTitle(title: "What are you counting?"),
        CuDropDown(dropdownItems: dropdownItems3),
        SizedBox(height: 20.h),
        const CuDropDownTitle(title: "What is the scope of your count?"),
        CuDropDown(dropdownItems: dropdownItems3)
      ],
    ),
  );
}
