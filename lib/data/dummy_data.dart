import 'package:ItemOptix/data/gen/assets.gen.dart';
import 'package:ItemOptix/data/models/bluetooth_model.dart';
import 'package:ItemOptix/data/models/device_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/bluetooth_model.dart';

class DummyData {
  static List<BluetoothModel> bluetoothData = [
    BluetoothModel(id: 1, isTap: false, name: 'RFD850018305523020211'),
    BluetoothModel(id: 2, isTap: false, name: 'RFD850018305523233333'),
  ];

  static List<BluetoothModel> rfidReaderData = [
    BluetoothModel(id: 1, isTap: false, name: 'RFD850018305523020939'),
    BluetoothModel(id: 2, isTap: false, name: 'RFD850018305523233333'),
    BluetoothModel(id: 2, isTap: false, name: 'RFD8500183055232330211'),
  ];

  static List<DeviceModel> deviceDatas = [
    DeviceModel(
        name: 'RFID Readers',
        path: Assets.svg.homescreen.android.reader.svg(
            // fit: BoxFit.fill,
            ),
        isCollapse: false),
    DeviceModel(
        name: 'RFID Printers',
        path: Assets.svg.homescreen.android.print.svg(
            // fit: BoxFit.fill,
            ),
        isCollapse: false),
    DeviceModel(
        name: 'Printers',
        path: Assets.svg.homescreen.android.print.svg(
            // fit: BoxFit.fill,
            ),
        isCollapse: false),
  ];
}

class CountItemData {
  static List listTile1 = [
    "Denim",
    "Health Beauty",
    "Junior Denim",
    "Mens Denim",
    "Mens Shoes",
    "Nike Brand",
    "Womens Fashion",
    "Footwear",
    "Denim",
    "Health Beauty",
    "Junior Denim",
    "Mens Denim",
    "Mens Shoes",
    "Nike Brand",
    "Womens Fashion",
    "Footwear",
  ];
  static List listTile2 = [
    "Department",
    "Style",
    "Department",
    "Category",
    "Color",
    "Category"
  ];
  static List checkboxItems = [
    "True Blue",
    "Purple",
    "Pink",
    "Green",
    "Yellow",
    "Gray",
    "White",
    "Brown",
    "Orange",
  ];
  static List dropdownItems1 = [
    "I'm counting by myself",
    "The team is counting"
  ];
  static List dropdownItems2 = [
    "location1",
    "location2",
    "location3",
    "location4"
  ];
  static List dropdownItems3 = [
    "I'm counting everything",
    "just sub-set of items"
  ];
  static List sizeNames = [
    "Red T-shirt, M",
    "Red T-shirt, L",
    "BLk T-shirt, S",
    "Wht T-shirt, XL",
    "Wht Shirt, 42",
    "Wht T-shirt, 38",
    "BLk T-shirt, S",
    "Wht T-shirt, XL",
    "Wht Shirt, 42"
  ];
}
