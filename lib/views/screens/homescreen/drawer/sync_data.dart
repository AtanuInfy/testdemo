import 'dart:async';
import 'package:ItemOptix/views/style/app_styles.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';

class SyncDataPage extends StatefulWidget {
  const SyncDataPage({Key? key}) : super(key: key);

  @override
  State<SyncDataPage> createState() => _SyncDataPageState();
}

class _SyncDataPageState extends State<SyncDataPage> {


  tapCancel() {
    Navigator.pop(context,true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      backgroundColor: colorTransparent,
      actions: [
        Container(
          height: 360,
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
                      'Sync Data',
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
              SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 95.0, vertical: 6.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      primary: colorPrimaryBlue),
                  onPressed: () {},
                  child: Text("SYNC ALL")),
              SizedBox(
                height: 50,
                child: ListTile(
                  title: Text('Configuration:',
                      style: typoBold14.copyWith(color: colorBlack)),
                  subtitle: Text('March 15,2022 at 12:02 PM',
                      style: typoRegular12.copyWith(color: colorBlack)),
                  trailing: Text('SYNC',
                      style: typoBold16.copyWith(color: colorPrimaryBlue)),
                ),
              ),
              SizedBox(height: 5,),
              SizedBox(
                height: 50,
                child: ListTile(
                  title: Text('Tasks:',
                      style: typoBold14.copyWith(color: colorBlack)),
                  subtitle: Text('March 15,2022 at 12:02 PM',
                      style: typoRegular12.copyWith(color: colorBlack)),
                  trailing: Text('SYNC',
                      style: typoBold16.copyWith(color: colorPrimaryBlue)),
                ),
              ),
              SizedBox(height: 5,),
              SizedBox(
                height: 50,
                child: ListTile(
                  title: Text('ASN:',
                      style: typoBold14.copyWith(color: colorBlack)),
                  subtitle: Text('March 15,2022 at 12:02 PM',
                      style: typoRegular12.copyWith(color: colorBlack)),
                  trailing: Text('SYNC',
                      style: typoBold16.copyWith(color: colorPrimaryBlue)),
                ),
              ),
              SizedBox(height: 5,),
              SizedBox(
                height: 50,
                child: ListTile(
                  title: Text('Location:',
                      style: typoBold14.copyWith(color: colorBlack)),
                  subtitle: Text('March 15,2022 at 12:02 PM',
                      style: typoRegular12.copyWith(color: colorBlack)),
                  trailing: Text('SYNC',
                      style: typoBold16.copyWith(color: colorPrimaryBlue)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
