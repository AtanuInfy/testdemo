import 'dart:async';
import 'package:ItemOptix/views/style/app_styles.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ConnectedPopup extends StatefulWidget {
  final String keyValue; 
  const ConnectedPopup({Key? key,required this.keyValue}) : super(key: key);

  @override
  State<ConnectedPopup> createState() => _ConnectedPopupState();
}

class _ConnectedPopupState extends State<ConnectedPopup> {
  String lastOption = "A";

  tapCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      backgroundColor: colorTransparent,
      actions: [
        Container(
          height: 400,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          decoration: decoration.copyWith(color: colorWhite),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                margin: EdgeInsets.only(top: 8, left: 8, right: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () => tapCancel(),
                        child: Container(
                            width: 25.sp,
                            height: 25.sp,
                            decoration: BoxDecoration(
                                color: PrimaryColors.p600,
                                borderRadius: BorderRadius.circular(1000.sp)),
                            child:
                                Icon(Icons.close_rounded, color: colorWhite))),
                    SizedBox(
                      width: 16,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 16,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: LinearPercentIndicator(
                    lineHeight: 4.0,
                    percent: 0.35,
                    progressColor: colorPrimaryBlue,
                  ),
                ),
              ),
              Text(
                "Let's get you started \nwith RFID!",
                // "$index",
                style:
                    typoBalo16.copyWith(fontSize: 22, color: colorPrimaryBlue),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Please choose the RFID Hand-held \n Reader you want to connect  to ...",
                style: typoRegular16,
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: "A",
                                    groupValue: lastOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        lastOption = value.toString();
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width -
                                            32) /
                                        3,
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Flexible(
                                          child: Text(
                                            "Yes, please help me get connected",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: "B",
                                    groupValue: lastOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        lastOption = value.toString();
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width -
                                            32) /
                                        3,
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Flexible(
                                          child: Text(
                                            "No thanks, I will connect to it later",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  )),
              Spacer(),
              SizedBox(
                height: 30,
              )
            ],
          ),
        )
      ],
    );
  }
}
