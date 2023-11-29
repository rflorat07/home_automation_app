import 'dart:async';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../devices/data/models/device.model.dart';
import '../../devices/presentation/providers/add_device_providers.dart';
import '../models/device_response.model.dart';

class DeviceHttpService {
  final Ref ref;
  DeviceHttpService({required this.ref});

  Future<DeviceResponse> toggleDevice(DeviceModel device) async {
    try {
      final outlet = ref
          .read(outletListVMProvider)
          .firstWhere((o) => int.parse(o.id) == device.outlet);

      final url = Uri.http(
        outlet.ip,
        'replay/${outlet.id}',
        {'turn': (device.isSelected ? 'off' : 'on')},
      );

      final response = await http.get(url).timeout(2.seconds);

      return DeviceResponse(
          statusCode: response.statusCode, success: response.statusCode == 200);
    } on TimeoutException {
      return DeviceResponse(statusCode: 0, success: false);
    } on Exception {
      return DeviceResponse(statusCode: 0, success: false);
    }
  }
}
