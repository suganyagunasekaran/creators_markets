import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/providers.dart';
import '../../data/model/creator_model.dart';
import '../../data/repositories/creator_repository.dart';

final creatorProvider = AsyncNotifierProvider<
    CreatorNotifier,
    List<CreatorModel>>(
  CreatorNotifier.new,
);

class CreatorNotifier
    extends AsyncNotifier<List<CreatorModel>> {

  int page = 1;
  bool isLoadingMore = false;

  CreatorRepository get repository =>
      ref.read(repositoryProvider);

  @override
  Future<List<CreatorModel>> build() async {
    return await repository.getCreators(
      page,
    );
  }

  Future<void> loadMore() async {
    if (isLoadingMore) return;

    isLoadingMore = true;

    try {
      final current =
          state.value ?? [];

      page++;

      final next =
      await repository.getCreators(
        page,
      );

      state = AsyncData([
        ...current,
        ...next,
      ]);
    } catch (e, st) {
      state = AsyncError(e, st);
    }

    isLoadingMore = false;
  }

  Future<void> refreshData() async {
    try {
      page = 1;

      state = const AsyncLoading();

      final creators =
      await repository.getCreators(
        page,
      );

      state = AsyncData(creators);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}