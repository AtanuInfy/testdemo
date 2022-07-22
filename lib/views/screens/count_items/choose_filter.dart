import 'package:ItemOptix/data/dummy_data.dart';
import 'package:ItemOptix/views/screens/count_items/progress_page1.dart';
import 'package:ItemOptix/views/screens/count_items/progress_page2.dart';
import 'package:ItemOptix/views/screens/count_items/question_dropdown.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/widgets/bottons.dart';
import 'package:ItemOptix/views/widgets/count_item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseFilter extends StatefulWidget {
  const ChooseFilter({Key? key}) : super(key: key);

  @override
  State<ChooseFilter> createState() => _ChooseFilterState();
}

class _ChooseFilterState extends State<ChooseFilter> {
  bool isCheckBox = false;
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
                  MaterialPageRoute(builder: (context) => ProgressPage1()),
                );
              },
              name: "APPLY"),
          SizedBox(
            width: 21.w,
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 120.h,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CountItemPageTitle(
                      title: "Choose Filter", height: 36.h, width: 160.w),
                  Align(
                    alignment: const Alignment(0.80, 0.0),
                    child: Text(
                      "RESET ALL FILTERS",
                      style: TextStyle(
                        color: PrimaryColors.p600,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ]),
          ),
          ListView(
            itemExtent: 450.h,
            shrinkWrap: true,
            children: [
              // this row holds 2 containers
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // this has listile
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 500.h,
                      color: NeutralColors.n30,
                      child: ListView(
                        shrinkWrap: true,
                        // itemCount: CountItemData.listTile2.length,
                        // itemBuilder: (context, index) {
                        //   return CountItemWidgets.chooseFilterListile(
                        //       CountItemData.listTile2[index]);
                        // },
                        children: [
                          ChooseFilterListile(
                              title: CountItemData.listTile2[0]),
                          ChooseFilterListile(
                              title: CountItemData.listTile2[1]),
                          chooseFilterListile("Color"),
                          ChooseFilterListile(
                              title: CountItemData.listTile2[3]),
                          ChooseFilterListile(
                              title: CountItemData.listTile2[2]),
                          ChooseFilterListile(
                              title: CountItemData.listTile2[5]),
                        ],
                      ),
                    ),
                  ),
                  // this has checkbox header
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: NeutralColors.n10,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 4.w, top: 10.h, right: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                customCheckbox(name: "Match all"),
                                TextButton(
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  child: Transform.translate(
                                    offset: Offset(10.w, 0),
                                    child: Text(
                                      "CLEAR",
                                      style: TextStyle(
                                        color: PrimaryColors.p600,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(thickness: 2, indent: 2.w),
                          // this has checkboxs
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: 20.w),
                              shrinkWrap: true,
                              itemCount: CountItemData.checkboxItems.length,
                              itemBuilder: (context, index) {
                                return CuCheckbox(
                                    title: CountItemData.checkboxItems[index],
                                    value: isCheckBox);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  InkWell customCheckbox({required String name}) {
    return InkWell(
      onTap: () {
        isCheckBox = !isCheckBox;
        print("Match all tapped...$isCheckBox");
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Theme(
            data: ThemeData(
              unselectedWidgetColor: NeutralColors.n50,
            ),
            child: Transform.scale(
              scale: 1.2,
              child: Checkbox(
                value: isCheckBox,
                activeColor: PrimaryColors.p600,
                onChanged: (val) {
                  isCheckBox = val!;
                  setState(() {});
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-6.w, 0),
            child: Text(
              name,
              style: TextStyle(
                color: NeutralColors.n90,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}

chooseFilterListile(String title) {
  return Container(
    height: 64.h,
    width: 311.w,
    // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
    padding: EdgeInsets.only(top: 14.h, left: 4.w),
    decoration: const BoxDecoration(
        border: Border(left: BorderSide(color: PrimaryColors.p600, width: 4))),
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: NeutralColors.n90,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        size: 30.r,
        color: PrimaryColors.p600,
      ),
      // style: ListTileStyle.list,
      selectedColor: PrimaryColors.p600,
      onTap: () {
        print("List tile tapped");
      },
    ),
  );
}
