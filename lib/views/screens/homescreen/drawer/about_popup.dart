import 'dart:async';
import 'package:ItemOptix/views/style/app_styles.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';


class AboutPopup extends StatefulWidget {
  const AboutPopup({Key? key}) : super(key: key);

  @override
  State<AboutPopup> createState() => _AboutPopupState();
}

class _AboutPopupState extends State<AboutPopup> {


  tapCancel() {
    Navigator.pop(context,true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: colorTransparent,
      actions: [
        Container(
          height: 350,
          decoration: decoration.copyWith(color: colorWhite),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    boxShadow: boxShadow,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    color: colorWhite),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'About',
                      style: typoBalo22.copyWith(
                          color: colorPrimaryBlue, fontSize: 22),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                        onTap: () => tapCancel(),
                        child: Icon(
                          Icons.cancel,
                          color: colorPrimaryBlue,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Site information:',
                style: typoBold14.copyWith(color: colorBlack),
              ),
              Text(
                'Deckers_11001',
                style: typoRegular14.copyWith(color: colorNeutralGray90),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'App Version Number:',
                style: typoBold14,
              ),
              Text(
                'v1.01.00',
                style: typoRegular14.copyWith(color: colorNeutralGray90),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Mobile Device:',
                style: typoBold14,
              ),
              Text(
                'RFD8500-183055-2302-0229',
                style: typoRegular14.copyWith(color: colorNeutralGray90),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Server URL:',
                style: typoBold14,
              ),
              Text(
                'https:deckers.com',
                style: typoRegular14.copyWith(color: colorNeutralGray90),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Core Version::',
                style: typoBold14,
              ),
              Text(
                'v13.01.00',
                style: typoRegular14.copyWith(color: colorNeutralGray90),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        )
      ],
    );
  }
}
