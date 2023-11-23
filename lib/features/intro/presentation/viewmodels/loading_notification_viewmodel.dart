import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/enums.dart';
import '../../../devices/presentation/providers/add_device_providers.dart';
import '../../../devices/presentation/providers/device_providers.dart';
import '../../../shared/providers/shared_providers.dart';
import '../providers/loading_page_providers.dart';

class LoadingNotificationViewModel extends StateNotifier<AppLoadingStates> {
  final Ref ref;
  LoadingNotificationViewModel(super.state, this.ref);

  Future<void> triggerLoading() async {
    state = AppLoadingStates.loading;

    ref.read(loadingMessageProvider.notifier).state = 'Initializing App...';

    // perform waiting logic here
    final localStorageInitialized =
        await ref.read(localStorageProvider).initLocalStorage();
    await Future.delayed(1.seconds);

    ref.read(loadingMessageProvider.notifier).state = 'Loading Device List...';
    final devicesList =
        await ref.read(deviceRepositoryProvider).getListOfDevices();
    ref.read(deviceListVMProvider.notifier).initializeState(devicesList);
    await Future.delayed(1.seconds);

    ref.read(loadingMessageProvider.notifier).state =
        'Loading Outlet Config...';
    final outletListLoaded = await ref.read(outletListFutureProvider.future);
    final result = localStorageInitialized && outletListLoaded;

    // perform waiting logic here
    await Future.delayed(1.seconds);
    ref.read(loadingMessageProvider.notifier).state =
        result ? 'Done!' : 'Error Loading App';
    state = result ? AppLoadingStates.success : AppLoadingStates.error;
  }
}
