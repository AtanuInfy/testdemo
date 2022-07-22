import 'package:ItemOptix/data/dummy_data.dart';
import 'package:ItemOptix/data/models/device_model.dart';
import 'package:ItemOptix/views/screens/homescreen/drawer/devices/add_device.dart';
import 'package:ItemOptix/views/screens/homescreen/home_page.dart';
import 'package:ItemOptix/views/style/colors.dart';
import 'package:ItemOptix/views/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'disconnect_popup.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({Key? key}) : super(key: key);

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();

  tapAdd(DeviceModel item) {
    setState(() {
      item.isCollapse = !item.isCollapse;
      DummyData.deviceDatas.length;
    });
  }

  tapAddDevice() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddDevicePage(),
      ),
    );
  }

  tapDisconnect() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DisconnectPopup();
      },
    );
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const DisconnectPopup(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Device',
          style: typoBalo16.copyWith(color: colorWhite),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=>_scaffoldKey1.currentState == null
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: SvgPicture.asset(
                      'assets/svg/homescreen/android/scan.svg'),
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
            children: DummyData.deviceDatas
                .map<Widget>((e) => buildHeader(e, e.path, e.name))
                .toList()),
      ),
    );
  }

  buildHeader(
    DeviceModel item,
    Widget path,
    String name,
  ) =>
      Column(
        children: [
          Container(
            color: Color(0xFFB3DFE2),
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 32),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        path,
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          name,
                          style: typoBalo16,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () => tapAddDevice(),
                      child: SvgPicture.asset(
                          'assets/svg/homescreen/android/add_green.svg'))
                ]),
          ),
          Container(
            color: Color(0xF5F5F5),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 32),
            child: ExpansionTile(
              maintainState: item.isCollapse,
              initiallyExpanded: item.isCollapse,
              key: GlobalKey(),
              onExpansionChanged: (val) {
                item.isCollapse = val; // update here on change
                setState(() {});
              },
              trailing: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: RotationTransition(
                    turns: item.isCollapse
                        ? AlwaysStoppedAnimation(90 / 360)
                        : AlwaysStoppedAnimation(360),
                    child: SvgPicture.asset(
                        'assets/svg/homescreen/android/gren_right.svg')),
              ),
              title: Text("RFD850018305523020211",
                  maxLines: 2, style: typoRegular18),
              subtitle: Text(
                'Connected',
                style: typoBold18.copyWith(
                  color: colorPrimaryBlue,
                ),
              ),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Serial Number:',
                        style: typoBold14,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        '1539347654312',
                        style:
                            typoRegular14.copyWith(color: colorNeutralGray100),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Firmware Version:',
                        style: typoBold14,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'PAACPS00-006-R78',
                        style:
                            typoRegular14.copyWith(color: colorNeutralGray100),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => tapDisconnect(),
                            child: Text(
                              'DISCONNECT',
                              style: typoBalo16.copyWith(
                                color: colorPrimaryBlue,
                              ),
                            ),
                          ),
                          InkWell(
                            child: Text(
                              'LOCATE DEVICE',
                              style: typoBalo16.copyWith(
                                color: colorPrimaryBlue,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
}
