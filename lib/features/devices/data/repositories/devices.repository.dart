import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/enums.dart';
import '../models/device.model.dart';

class DevicesRepository {
  final Ref ref;
  DevicesRepository(this.ref);

  Future<List<DeviceModel>> getListOfDevices() {
    return Future.delayed(2.seconds, () {
      return [
        DeviceModel(
          iconOption: FlickyAnimatedIconOptions.fan,
          label: 'Ceiling Fan',
          isSelected: false,
          outlet: 0,
        ),
        DeviceModel(
          iconOption: FlickyAnimatedIconOptions.lightbulb,
          label: 'Kitchen Light',
          isSelected: false,
          outlet: 1,
        ),
      ];
    });
  }
}
