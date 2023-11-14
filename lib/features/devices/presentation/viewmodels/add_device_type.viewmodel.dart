import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/device.model.dart';

class AddDeviceTypeViewModel extends StateNotifier<List<DeviceModel>> {
  AddDeviceTypeViewModel(super._state);

  void onSelectedDeviceType(DeviceModel selectedType) {
    state = [
      for (final item in state) item.copyWith(isSelected: selectedType == item)
    ];
  }

  DeviceModel getSelectedDeviceType() {
    return state.where((device) => device.isSelected).first;
  }
}
