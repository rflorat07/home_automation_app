import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/outlet.model.dart';
import '../providers/add_device_providers.dart';

class OutletListViewModel extends StateNotifier<List<OutletModel>> {
  final Ref ref;

  OutletListViewModel(super.state, this.ref);

  void initializeList(List<OutletModel> outletList) {
    state = outletList;
  }

  void onSelectedOutlet(OutletModel outletModel) {
    ref.read(outletValueProvider.notifier).state = outletModel;
  }
}
