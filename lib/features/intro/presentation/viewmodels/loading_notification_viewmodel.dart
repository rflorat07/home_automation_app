import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/enums.dart';
import '../../../devices/presentation/providers/device_providers.dart';
import '../providers/loading_page_providers.dart';

class LoadingNotificationViewModel extends StateNotifier<AppLoadingStates> {
  final Ref ref;
  LoadingNotificationViewModel(super.state, this.ref);

  Future<void> triggerLoading() async {
    state = AppLoadingStates.loading;

    ref.read(loadingMessageProvider.notifier).state = 'Initializing App...';

    // perform waiting logic here
    await Future.delayed(const Duration(seconds: 1));
    ref.read(loadingMessageProvider.notifier).state = 'Loading Device List...';
    final devicesList =
        await ref.read(devicesRepositoryProvider).getListOfDevices();
    ref.read(deviceListVMProvider.notifier).initializeState(devicesList);

    // perform waiting logic here
    await Future.delayed(const Duration(seconds: 1));
    ref.read(loadingMessageProvider.notifier).state =
        'Loading Outlet Config...';

    // perform waiting logic here
    await Future.delayed(const Duration(seconds: 1));
    ref.read(loadingMessageProvider.notifier).state = 'Done!';

    state = AppLoadingStates.success;
  }
}
