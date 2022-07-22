import 'package:ItemOptix/views/style/app_styles.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountSubmitPopup extends StatefulWidget {
  const CountSubmitPopup({Key? key}) : super(key: key);

  @override
  State<CountSubmitPopup> createState() => _CountSubmitPopupState();
}

class _CountSubmitPopupState extends State<CountSubmitPopup> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      backgroundColor: colorTransparent,
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 32),
                child: Container(
                  decoration: decoration.copyWith(
                    color: colorWhite,
                  ),
                  height: 200,
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                            child: Text(
                              "Are you sure you want \nto submit the current \n scan ?",
                              textAlign: TextAlign.center,
                              style: typoBold16,
                              maxLines: 3,
                            )),
                      ),
                      Container(
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal:20.0, vertical: 12.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.0)),
                                    primary: NoticeColors.main),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CountSubmitPopup()));
                                },
                                child: Text("CANCEL")),
                            SizedBox(width: 15,),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal:40.0, vertical: 12.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.0)),
                                    primary: colorPrimaryBlue),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CountSubmitPopup()));
                                },
                                child: Text("OK")),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 15.0,
                                  offset: Offset(0.0, 0.75)
                              )
                            ],
                            color: PositiveColors.border,
                            borderRadius:
                            BorderRadius.all(Radius.circular(32))),
                        width: 65,
                        height: 65,
                        child:
                        SvgPicture.asset('assets/svg/count_items/cloud.svg',),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

