import 'dart:async';
import 'package:ItemOptix/views/screens/homescreen/scanner/connectedPopup.dart';
import 'package:ItemOptix/views/style/app_styles.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RFIDPopup extends StatefulWidget {
  const RFIDPopup({Key? key}) : super(key: key);

  @override
  State<RFIDPopup> createState() => _RFIDPopupState();
}

class _RFIDPopupState extends State<RFIDPopup> {
  Timer? _timer;
  int _start = 5;
  int index = 0;
  void startTimer() {
    const oneSec = const Duration(seconds: 2);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start >= 0 && index != 2) {
          setState(() {
            index++;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

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
                    percent: index == 0
                        ? 0.5
                        : index == 1
                            ? 0.75
                            : 1,
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
                index == 0
                    ? "Please turn on your bluetooth ..."
                    : "Please choose the RFID Hand-held \n Reader you want to connect  to ...",
                style: typoRegular16,
              ),
              if (index == 0)
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Radio(
                          value: true,
                          groupValue: true,
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 32) / 3,
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Flexible(
                                child: Text(
                                  "Yes, It is now on",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              else if (index == 1)
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ConnectedPopup(
                                  keyValue: "RFD850018305523020211",
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.bluetooth),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "RFD850018305523020211",
                                maxLines: 2,
                                style: typoRegular14.copyWith(
                                    color: colorNeutralGray100),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ))
              else if (index == 2)
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Row(
                            children: [
                              Icon(Icons.bluetooth),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "RFD850018305523020211",
                                  maxLines: 2,
                                  style: typoRegular14.copyWith(
                                      color: colorNeutralGray100),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ConnectedPopup(
                                  keyValue: "RFD850018305523020229",
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.bluetooth),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "RFD850018305523020229",
                                  style: typoRegular14.copyWith(
                                      color: colorNeutralGray100),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        // isConnected2 == true || isConnected1 == true
                        //     ? GestureDetector(

                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 32.0),
                        //           child: Text(
                        //             'Connected',
                        //             style: typoBalo14.copyWith(
                        //               color: colorPrimaryBlue,
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //     : SizedBox(),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    )),
              Spacer(),
              if (index == 1)
                Text(
                  'Looking for devices ...',
                  style: typoBalo14.copyWith(
                      color: Color.fromARGB(255, 4, 25, 131)),
                )
              else if (index == 2)
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.sp),
                        width: 10.sp,
                        height: 10.sp,
                        decoration: BoxDecoration(
                            color: SecondaryColors.s300,
                            borderRadius: BorderRadius.circular(10000.sp)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.sp),
                        width: 10.sp,
                        height: 10.sp,
                        decoration: BoxDecoration(
                            color: SecondaryColors.s500,
                            borderRadius: BorderRadius.circular(10000.sp)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.sp),
                        width: 10.sp,
                        height: 10.sp,
                        decoration: BoxDecoration(
                            color: SecondaryColors.s700,
                            borderRadius: BorderRadius.circular(10000.sp)),
                      ),
                    ],
                  ),
                ),
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
