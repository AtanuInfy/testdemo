import 'package:ItemOptix/views/style/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CuCheckbox extends StatelessWidget {
  final String title;
  bool value;
  CuCheckbox({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: NeutralColors.n50,
      ),
      child: Transform.scale(
        scale: 1.2,
        child: CheckboxListTile(
          value: value,
          activeColor: PrimaryColors.p600,
          onChanged: (val) {
            print("checkbox tapped");
            value = !value;
          },
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          title: Transform.translate(
              offset: Offset(-15.w, 0), child: CheckBoxTitle(title: title)),
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    );
  }
}

class CuDropDownTitle extends StatelessWidget {
  final String title;
  const CuDropDownTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: TextStyle(
          color: NeutralColors.n90,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
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

        // shape: ShapeBorder(),
      ),
    );
  }
}

class CuSearchBox extends StatelessWidget {
  const CuSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 306.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
        border: Border.all(color: PrimaryColors.p600),
      ),
      padding: const EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 10).r,
      child: TextField(
        decoration: InputDecoration(
          // enabledBorder: ,
          icon: Padding(
            padding: EdgeInsets.only(left: 0.0.r),
            child: Icon(
              Icons.search,
              color: NeutralColors.n50,
              size: 20.sp,
            ),
          ),
          hintText: "Search",
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: NeutralColors.n90,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        onChanged: (_) {},
      ),
    );
  }
}

class CuDropDown extends StatelessWidget {
  final List dropdownItems;
  // bool selectedValue = false;

  CuDropDown({
    Key? key,
    required this.dropdownItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _selectedValue;
    return DropdownButtonFormField2(
      selectedItemBuilder: (_) {
        return dropdownItems
            .map((e) => Text(
                  e,
                  style: const TextStyle(color: PrimaryColors.p600),
                ))
            .toList();
      },
      // searchInnerWidget: FlutterLogo(size: 30),
      value: _selectedValue,
      items: dropdownItems
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: (val) {
        _selectedValue = val as String;
      },
      // menuMaxHeight: 40.h,
      hint: Text(
        "Select",
        style: TextStyle(
          color: NeutralColors.n90,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      icon: const RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.chevron_right,
          color: PrimaryColors.p600,
        ),
      ),
      decoration: InputDecoration(
        // hoverColor: PrimaryColors.p600,
        focusColor: PrimaryColors.p600,
        fillColor: PrimaryColors.p600,

        // filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: PrimaryColors.p600),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: PrimaryColors.p600),
        ),
      ),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        // color: Colors.redAccent,
      ),
      offset: const Offset(0, -6),
    );
  }
}

class CheckBoxTitle extends StatelessWidget {
  final String title;
  const CheckBoxTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: NeutralColors.n90,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class ChooseFilterListile extends StatelessWidget {
  final String title;

  const ChooseFilterListile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 311.w,
      // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      padding: EdgeInsets.only(top: 14.h, left: 4.w),
      // decoration: const BoxDecoration(
      //     border:
      //         Border(left: BorderSide(color: PrimaryColors.p600, width: 4))),
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
          // color: PrimaryColors.p600,
        ),
        // style: ListTileStyle.list,
        selectedColor: PrimaryColors.p600,
        onTap: () {
          print("List tile tapped");
        },
      ),
    );
  }
}

class CountItemPageTitle extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  const CountItemPageTitle({
    Key? key,
    required this.title,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        title,
        style: TextStyle(
            color: SecondaryColors.s900,
            fontWeight: FontWeight.w600,
            fontSize: 28.sp,
            letterSpacing: -2.1),
        textAlign: TextAlign.center,
      ),
      height: height.h,
      width: width.w,
    );
  }
}

class CuSwitch extends StatelessWidget {
  final VoidCallback onPress;
  final Widget child;
  final String name;
  const CuSwitch(
      {Key? key,
      required this.onPress,
      required this.child,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Theme(
            data: ThemeData(
              unselectedWidgetColor: NeutralColors.n50,
            ),
            child: Transform.scale(
              scale: 1.3,
              child: child,
            ),
          ),
          Transform.translate(
            offset: Offset(6.w, 0),
            child: Text(
              name,
              style: TextStyle(
                color: SecondaryColors.s900,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CuRow extends StatelessWidget {
  final Widget child;
  final String name;
  final Color color;
  const CuRow(
      {Key? key,
      required this.child,
      required this.name,
      this.color = SecondaryColors.s900})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Theme(
          data: ThemeData(
              unselectedWidgetColor: NeutralColors.n50,
              primaryColor: SecondaryColors.s900),
          child:
// Transform.scale(
//               scale: 1.2,
//               child:
              child,
          // ),
        ),
        Transform.translate(
          offset: Offset(6.w, 0),
          child: Text(
            name,
            style: TextStyle(
              color: color,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
