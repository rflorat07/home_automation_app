import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/home_tile_option.dart';
import '../../data/repositories/energy_consumtion_data.repository.dart';
import '../../data/repositories/home_tile_options.repository.dart';
import '../viewmodels/home_tile_options.viewmodel.dart';

final homeTileOptionsRepositoryProvider = Provider((ref) {
  return HomeTileOptionsRepository();
});

final homeTileOptionsVMProvider =
    StateNotifierProvider<HomeTileOptionsViewModel, List<HomeTileOption>>(
        (ref) {
  final options =
      ref.read(homeTileOptionsRepositoryProvider).getHomeTileOptions();
  return HomeTileOptionsViewModel(options, ref);
});

final energyConsumptionRepositoryProvider = Provider((ref) {
  return EnergyConsumptionDataRepository();
});

final energyConsumptionProvider = Provider((ref) {
  return ref.read(energyConsumptionRepositoryProvider).getEnergyConsuption();
});
