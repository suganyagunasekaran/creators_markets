import '../../../core/network/network_info.dart';
import '../data_source/creator_local_datasource.dart';
import '../data_source/creator_remote_datasource.dart';
import '../model/creator_model.dart';

abstract class CreatorRepository {
  Future<List<CreatorModel>> getCreators(
      int page,
      );
}

class CreatorRepositoryImpl
    implements CreatorRepository {
  final CreatorRemoteDataSource remote;
  final CreatorLocalDataSource local;
  final NetworkInfo networkInfo;

  CreatorRepositoryImpl({
    required this.remote,
    required this.local,
    required this.networkInfo,
  });

  @override
  Future<List<CreatorModel>> getCreators(
      int page,
      ) async {
    try {
      if (await networkInfo.isConnected) {
        final creators =
        await remote.getCreators(page);

        await local.saveCreators(creators);

        return creators;
      }

      return local.getCreators() ?? [];
    } catch (e) {
      return local.getCreators() ?? [];
    }
  }
}