import 'package:hive/hive.dart';

import '../model/creator_model.dart';

class CreatorLocalDataSource {
  final Box box;

  CreatorLocalDataSource(
      this.box,
      );

  Future<void> saveCreators(
      List<CreatorModel> creators,
      ) async {
    await box.put(
      'creators',
      creators
          .map(
            (e) => e.toJson(),
      )
          .toList(),
    );
  }

  List<CreatorModel>? getCreators() {
    final data =
    box.get('creators');

    if (data == null) {
      return null;
    }

    return (data as List)
        .map(
          (e) =>
          CreatorModel.fromJson(
            Map<String, dynamic>.from(
              e,
            ),
          ),
    )
        .toList();
  }
}