import 'dart:convert';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/shared_providers.dart';
import '../models/device.model.dart';

class DevicesRepository {
  final Ref ref;
  DevicesRepository(this.ref);

  Future<List<DeviceModel>> getListOfDevices() {
    return Future.delayed(2.seconds, () {
      String configAsString =
          ref.read(localStorageProvider).getDeviceListConfig();

      List<DeviceModel> deviceList = [];

      if (configAsString.isNotEmpty) {
        List<dynamic> decodedList = json.decode(configAsString);

        deviceList = decodedList
            .map((d) => DeviceModel.fromJson(d as Map<String, dynamic>))
            .toList();
      }

      return deviceList;
    });
  }

  void saveDeviceList(List<DeviceModel> deviceList) {
    List<Map<String, dynamic>> serializedList =
        deviceList.map((device) => device.toJson()).toList();
    String deviceListAsString = json.encode(serializedList);
    ref.read(localStorageProvider).storeDeviceListConfig(deviceListAsString);
  }
}
