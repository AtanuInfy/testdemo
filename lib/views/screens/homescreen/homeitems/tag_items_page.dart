import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';


class TagItemsPage extends StatelessWidget {
  const TagItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        title: Text(
          'Tag Items',
          style: typoBalo16.copyWith(color: colorWhite),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
                onTap: () => {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: SvgPicture.asset(
                      'assets/svg/homescreen/android/scan.svg'),
                )),
          )
        ],
      ),
      body:  Center(
        child: Text(
          'Welcome to Tag Items Screen',
          style: typoBalo18.copyWith(color: colorPrimaryBlue),
        ),
      ),
    );
  }
}
