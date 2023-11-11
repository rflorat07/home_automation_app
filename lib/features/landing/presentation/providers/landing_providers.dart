import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/home_tile_option.dart';
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
