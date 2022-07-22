import 'package:ItemOptix/views/style/app_styles.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:ItemOptix/views/widgets/home_bottom_bar.dart';
import 'package:flutter/material.dart';


class SignoutPage extends StatelessWidget {
  const SignoutPage({Key? key}) : super(key: key);

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
                "Signout of the App",
                style: typoBalo22.copyWith(color: colorPrimaryBlue),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      primary: NoticeColors.main),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => MainBottomNav()));

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeBottomBar()));
                  },
                  child: Text("SIGN OUT"))
            ],
          ),
        )
      ],
    );
  }
}
