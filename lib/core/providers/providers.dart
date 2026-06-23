import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';

import '../../core/network/dio_client.dart';
import '../../core/network/network_info.dart';
import '../../features/data/data_source/creator_local_datasource.dart';
import '../../features/data/data_source/creator_remote_datasource.dart';
import '../../features/data/repositories/creator_repository.dart';

final dioProvider = Provider<Dio>(
      (ref) => DioClient().dio,
);

final connectivityProvider =
Provider<Connectivity>(
      (ref) => Connectivity(),
);

final networkInfoProvider =
Provider<NetworkInfo>(
      (ref) => NetworkInfo(
    ref.read(connectivityProvider),
  ),
);

final creatorsBoxProvider =
Provider<Box>(
      (ref) => Hive.box("creators"),
);

final themeProvider =
StateProvider<ThemeMode>(
      (ref) => ThemeMode.light,
);
final repositoryProvider =
Provider<CreatorRepository>(
      (ref) {
    return CreatorRepositoryImpl(
      remote: CreatorRemoteDataSource(
        ref.read(dioProvider),
      ),
      local: CreatorLocalDataSource(
        ref.read(creatorsBoxProvider),
      ),
      networkInfo:
      ref.read(networkInfoProvider),
    );
  },
);