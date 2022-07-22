import 'package:ItemOptix/views/style/app_styles.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';

class NoDevicePopup extends StatelessWidget {
  const NoDevicePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      backgroundColor: colorTransparent,
      actions: [
        Container(
          height: 250,
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
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel,
                          color: colorPrimaryBlue,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "No Devices Found",
                style: typoRegular18.copyWith(color: NoticeColors.main),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Make sure that your device are turn on and available to connect",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: typoRegular16.copyWith(color: colorBlack),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 8.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          primary: NoticeColors.main),
                      onPressed: () {
                        Navigator.pop(context);

                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => AddDevicePage()));
                      },
                      child: Text("CANCEL")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 8.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          primary: colorPrimaryBlue),
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return NoDevicePopup();
                          },
                        );
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => NoDevicePopup()));
                      },
                      child: Text("TRY AGAIN")),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
