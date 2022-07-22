import 'package:ItemOptix/data/dummy_data.dart';
import 'package:ItemOptix/data/models/bluetooth_model.dart';
import 'package:ItemOptix/views/screens/homescreen/home_page.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'no_device_popup.dart';

class AddDevicePage extends StatefulWidget {
  const AddDevicePage({Key? key}) : super(key: key);

  @override
  State<AddDevicePage> createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();

  late AnimationController controller;

  @override
  void initState() {
    tapOnId = -1;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Devices',
          style: typoBalo16.copyWith(color: colorWhite),
        ),
        // centerTitle: true,
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
            child: InkWell(
                onTap: () => {},
                child:
                    SvgPicture.asset('assets/svg/homescreen/android/scan.svg')),
          )
        ],
      ),
      body: Scaffold(
        drawer: DrawerMenu(),
        key: _scaffoldKey1,
        onDrawerChanged: (_) {
          setState(() {});
        },
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/homescreen/android/reader.svg'),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Available RFID Readers',
                    maxLines: 2,
                    style: typoRegular14.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: colorPrimaryBlue),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: LinearProgressIndicator(
                value: controller.value,
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: DummyData.rfidReaderData
                    .asMap()
                    .map((i, e) => MapEntry(
                        i, CustomTileForPairDevices(item: e, index: i)))
                    .values
                    .toList()),
          ],
        ),
      ),
    );
  }
}

int tapOnId = -1;

class CustomTileForPairDevices extends StatefulWidget {
  final BluetoothModel item;
  final int index;
  CustomTileForPairDevices({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  State<CustomTileForPairDevices> createState() =>
      _CustomTileForPairDevicesState();
}

class _CustomTileForPairDevicesState extends State<CustomTileForPairDevices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Get.width * 0.02),
      padding: EdgeInsets.symmetric(
          vertical: Get.width * 0.02, horizontal: Get.width * 0.06),
      width: Get.width,
      color: tapOnId == widget.index ? PrimaryColors.p50 : transparent,
      child: GestureDetector(
        onTapDown: (_) {
          tapOnId = widget.index;
          setState(() {});
        },
        onTapUp: (_) {
          tapNoDevices();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.item.name,
              maxLines: 2,
              style: typoBalo14.copyWith(
                  color:
                      tapOnId == widget.index ? colorPrimaryBlue : colorBlack),
            ),
            tapOnId == widget.index
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: Get.width * 0.02),
                    child: Text(
                      "Pairing...",
                      style: typoBold18.copyWith(color: PrimaryColors.p800),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  tapNoDevices() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NoDevicePopup();
      },
    );
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const NoDevicePopup(),
    //   ),
    // );
  }
}
