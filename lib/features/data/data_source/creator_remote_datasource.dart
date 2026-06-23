import 'package:dio/dio.dart';

import '../model/creator_model.dart';

class CreatorRemoteDataSource {
  final Dio dio;

  CreatorRemoteDataSource(
      this.dio,
      );

  Future<List<CreatorModel>> getCreators(
      int page,
      ) async {
    final response =
    await dio.get(
      '/users',
      queryParameters: {
        'limit': 20,
        'skip': (page - 1) * 20,
      },
    );

    final List users =
    response.data['users'];

    return users
        .map(
          (e) =>
          CreatorModel.fromJson(e),
    )
        .toList();
  }
}