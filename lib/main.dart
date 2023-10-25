import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';



void main() {
  void getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print(androidInfo.id);
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print(iosInfo.identifierForVendor);
    } else if (Platform.isWindows) {
      WindowsDeviceInfo windowsDeviceInfo = await deviceInfo.windowsInfo;
      print(windowsDeviceInfo.deviceId);
    }
  }

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('UDID'),
        ),
        body: ElevatedButton(onPressed: getDeviceId, child: Icon(Icons.delivery_dining_outlined),),
      ),
    ),
  );
}
