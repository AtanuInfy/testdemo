import 'dart:io';
import 'package:ItemOptix/views/screens/homescreen/home_page.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomScrollBar extends StatelessWidget {
  final Widget child;

  const CustomScrollBar({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: colorGreyBlue,
      radius: Radius.circular(8),
      thickness: 4,
      isAlwaysShown: true,
      child: child,
    );
  }
}

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();

  late AnimationController controller;
  List<PickedFile?> imageFileList = [];
  TextEditingController _textEditingController = TextEditingController();
  final _scrollController = ScrollController(initialScrollOffset: 0);
  @override
  void initState() {
    super.initState();
    _textEditingController.text =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.";
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: typoBalo16.copyWith(color: colorWhite),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => _scaffoldKey1.currentState == null
              ? _scaffoldKey1.currentState!.openDrawer()
              : _scaffoldKey1.currentState!.isDrawerOpen
                  ? _scaffoldKey1.currentState!.closeDrawer()
                  : _scaffoldKey1.currentState!.openDrawer(),
          icon: Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MaterialButton(
                elevation: 0,
                onPressed: () {},
                child: Text(
                  "SUBMIT",
                  style: typoBalo18.copyWith(color: colorWhite),
                )),
          )
        ],
      ),
      body: Scaffold(
        drawer: DrawerMenu(),
        key: _scaffoldKey1,
        onDrawerChanged: (_) {
          setState(() {});
        },
        body: ListView(
          children: [
            SizedBox(
              height: Get.width * 0.035,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: Get.width * 0.01, horizontal: Get.width * 0.08),
              child: Text(
                "Description",
                maxLines: 2,
                style: typoBalo18.copyWith(color: colorBlack),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: Get.width * 0.01, horizontal: Get.width * 0.08),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.start,
                maxLines: 8,
                maxLength: 500,
                style: typoRegular18.copyWith(color: colorGrey),
                controller: _textEditingController,
                onChanged: (_) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    isDense: true,
                    counterText: "",
                    border: InputBorder.none,
                    filled: true,
                    fillColor: colorWhite,
                    hintStyle: typoRegular18.copyWith(color: colorGrey),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.03,
                        vertical: Get.width * 0.02),
                    hintText: "Type here...",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: PrimaryColors.p500)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: PrimaryColors.p500))),
              ),
            ),
            SizedBox(
              height: Get.width * 0.035,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: Get.width * 0.01, horizontal: Get.width * 0.08),
              child: Text(
                "Attachments",
                maxLines: 2,
                style: typoBalo18.copyWith(color: colorBlack),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(
                    vertical: Get.width * 0.01, horizontal: Get.width * 0.08),
                width: Get.width * 0.8,
                height: Get.width * 0.95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: colorGrey)),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: Get.width * 0.01,
                        ),
                        Container(
                          height: Get.width * 0.86,
                          width: Get.width * 0.8,
                          alignment: Alignment.center,
                          child: imageFileList.isEmpty
                              ? Text(
                                  "No Image Available",
                                  maxLines: 2,
                                  style: typoBalo18.copyWith(color: colorBlack),
                                )
                              : Container(
                                  width: Get.width * 0.86,
                                  child: Center(
                                    child: Scrollbar(
                                      isAlwaysShown: true,
                                      showTrackOnHover: false,
                                      hoverThickness: 35.0,
                                      controller: _scrollController,
                                      child: ListView(
                                        padding: EdgeInsets.all(10),
                                        controller: _scrollController,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        children: imageFileList
                                            .map(
                                              (e) => e == null
                                                  ? Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  Get.width *
                                                                      0.01),
                                                      height: Get.width * 0.86,
                                                      width: Get.width * 0.37,
                                                    )
                                                  : Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  Get.width *
                                                                      0.01),
                                                      child: Image.file(
                                                        File(e.path),
                                                        fit: BoxFit.cover,
                                                        height:
                                                            Get.width * 0.86,
                                                        width: Get.width * 0.37,
                                                      ),
                                                    ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(
                        //       horizontal: Get.width * 0.02),
                        //   child: SizedBox(
                        //     height: Get.width * 0.01,
                        //     width: Get.width - 10,
                        //     child: LinearProgressIndicator(
                        //       value: controller.value,
                        //       backgroundColor: PrimaryColors.p50,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Positioned(
                        right: Get.width * 0.02,
                        bottom: Get.width * 0.02,
                        child: GestureDetector(
                          onTap: () {
                            pickImageOption(context);
                          },
                          child: SvgPicture.asset(
                            'assets/svg/homescreen/android/attachment.svg',
                            width: Get.width * 0.15,
                            height: Get.width * 0.151,
                            fit: BoxFit.cover,
                          ),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  pickImageOption(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: colorWhite,
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            elevation: 0.0,
            titlePadding: EdgeInsets.zero,
            title:   Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Attachments",
                style:
                    typoBalo22.copyWith(color: colorPrimaryBlue, fontSize: 22)),
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            width: 25.sp,
                            height: 25.sp,
                            decoration: BoxDecoration(
                                color: PrimaryColors.p600,
                                borderRadius: BorderRadius.circular(1000.sp)),
                            child:
                                Icon(Icons.close_rounded, color: colorWhite))),
                  
                  ],
                ),
              ),
            children: [
              // Container(
              //   margin: EdgeInsets.only(top: Get.width * 0.03),
              //   decoration: BoxDecoration(
              //       border: Border(top: BorderSide(color: Colors.grey))),
              // ),
              Column(
                children: [
                  SimpleDialogOption(
                      padding: EdgeInsets.all(0),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: Get.width * 0.05),
                        leading:
                            Icon(Icons.camera_alt, color: colorNeutralGray100),
                        title: Text("Camera",
                            style: typoBalo22.copyWith(
                                color: colorNeutralGray100, fontSize: 22)),
                      ),
                      onPressed: () {
                        _onImageButtonPressed(context, ImageSource.camera);
                        Navigator.pop(context);
                      }),
                  SimpleDialogOption(
                      padding: EdgeInsets.all(0),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: Get.width * 0.05),
                        leading: Icon(Icons.photo_library,
                            color: colorNeutralGray100),
                        title: Text("Photo & Video Library",
                            style: typoBalo22.copyWith(
                                color: colorNeutralGray100, fontSize: 22)),
                      ),
                      onPressed: () {
                        _onImageButtonPressed(
                          context,
                          ImageSource.gallery,
                        );
                        Navigator.pop(context);
                      }),
                ],
              )
            ],
          );
        });
  }

  _onImageButtonPressed(BuildContext context, ImageSource imageSource) async {
    try {
      final pickedFile = await ImagePicker.platform
          .pickImage(source: imageSource, imageQuality: 50);
      if (pickedFile != null) {
        imageFileList.add(pickedFile);
      }
      setState(() {});
    } catch (e) {}
  }
}
