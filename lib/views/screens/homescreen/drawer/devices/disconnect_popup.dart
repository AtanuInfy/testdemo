import 'package:ItemOptix/views/style/app_styles.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';


class DisconnectPopup extends StatelessWidget {
  const DisconnectPopup({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      backgroundColor: colorTransparent,
      actions: [
        Container(
          height: 200,
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
              ),
              SizedBox(height: 20,),
              Text("RFD850018305523020211",style: typoRegular18.copyWith(color: colorPrimaryBlue),),
              SizedBox(height: 20,),
              Text("Has been Successfully disconnected",
                textAlign: TextAlign.center,
                style: typoRegular16.copyWith
                  (color: colorBlack),),
              SizedBox(height: 20,),
              SizedBox(width: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal:12.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      primary: colorPrimaryBlue),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => DevicePage()));
                    Navigator.pop(context);
                  },
                  child: Text("OK"))

            ],
          ),
        )
      ],
    );
  }
}
