import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/enums.dart';
import '../../../../helpers/utils.dart';
import '../../../devices/presentation/providers/add_device_providers.dart';
import '../../../devices/presentation/widgets/add_device_sheet.dart';
import '../../data/models/home_tile_option.dart';

class HomeTileOptionsViewModel extends StateNotifier<List<HomeTileOption>> {
  final Ref ref;

  HomeTileOptionsViewModel(super.state, this.ref);

  void onTileSelected(HomeTileOption selectedOption) {
    switch (selectedOption.option) {
      case HomeTileOptions.addDevice:
        Utils.showUIModel(
          Utils.mainNav.currentContext!,
          const AddDeviceSheet(),
          onDismissed: () {
            ref.read(saveAddDeviceVMProvider.notifier).resetAllValues();
          },
        );
        break;
      case HomeTileOptions.manageDevices:
        break;
      case HomeTileOptions.testConnection:
        break;
    }
  }
}
