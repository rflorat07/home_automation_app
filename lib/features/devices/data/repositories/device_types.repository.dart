import '../../../../helpers/enums.dart';
import '../models/device.model.dart';

class DeviceTypesRepository {
  List<DeviceModel> getDeviceTypeList() {
    return [
      DeviceModel(
        iconOption: FlickyAnimatedIconOptions.ac,
        label: 'Air\nConditioning',
        isSelected: false,
        outlet: 0,
      ),
      DeviceModel(
        iconOption: FlickyAnimatedIconOptions.hairdryer,
        label: 'Personal\nItem',
        isSelected: false,
        outlet: 0,
      ),
      DeviceModel(
        iconOption: FlickyAnimatedIconOptions.fan,
        label: 'Fan',
        isSelected: false,
        outlet: 0,
      ),
      DeviceModel(
        iconOption: FlickyAnimatedIconOptions.lightbulb,
        label: 'Light\nFixture',
        isSelected: false,
        outlet: 0,
      ),
      DeviceModel(
        iconOption: FlickyAnimatedIconOptions.bolt,
        label: 'Other',
        isSelected: false,
        outlet: 0,
      ),
    ];
  }
}
