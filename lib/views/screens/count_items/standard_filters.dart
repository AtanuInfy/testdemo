import 'package:ItemOptix/data/dummy_data.dart';
import 'package:ItemOptix/views/screens/count_items/choose_filter.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/widgets/bottons.dart';
import 'package:ItemOptix/views/widgets/count_item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StandardFilters extends StatefulWidget {
  const StandardFilters({Key? key}) : super(key: key);

  @override
  State<StandardFilters> createState() => _StandardFiltersState();
}

class _StandardFiltersState extends State<StandardFilters> {
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
                    builder: (context) => ChooseFilter(),
                  ),
                );
              },
              name: "NEXT"),
          SizedBox(
            width: 21.w,
          )
        ],
      ),
      // bottomNavigationBar: HomeBottomBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            SizedBox(
              height: 120.h,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountItemPageTitle(
                        title: "Standard Filter", height: 36.h, width: 177.w),
                    CuSearchBox(),
                  ]),
            ),
            SizedBox(height: 10.h),
            Expanded(
              flex: 4,
              child: Container(
                height: 500.h,
                color: NeutralColors.n30,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: CountItemData.listTile1.length,
                  itemBuilder: (context, index) {
                    return CuStandardFilterListile(
                        title: CountItemData.listTile1[index],
                        color: (index % 2) == 0
                            ? ListColors.lightRow
                            : ListColors.darkRow);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CuStandardFilterListile extends StatelessWidget {
  final String title;
  final Color color;
  const CuStandardFilterListile({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 311.w,
      // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      padding: const EdgeInsets.only(top: 14, bottom: 16, left: 20).r,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(8.r),

        color: color,
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: NeutralColors.n90,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          size: 30.r,
          color: PrimaryColors.p600,
        ),
        onTap: () {
          // Get.to(()=> );
        },

        // shape: ShapeBorder(),
      ),
    );
  }
}
