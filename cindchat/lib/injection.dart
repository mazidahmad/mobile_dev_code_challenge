import 'package:cindchat/data/datasources/local/sync_local_datasource.dart';
import 'package:cindchat/data/repositories/chat_repository_impl.dart';
import 'package:cindchat/data/repositories/sync_repository_impl.dart';
import 'package:cindchat/domain/repositories/chat_repository.dart';
import 'package:cindchat/domain/repositories/sync_repository.dart';
import 'package:cindchat/domain/usecases/chat/add_chat_data.dart';
import 'package:cindchat/domain/usecases/chat/get_all_chat_history.dart';
import 'package:cindchat/domain/usecases/sync_dummy_data.dart';
import 'package:cindchat/presentation/pages/chat/cubit/chat_cubit.dart';
import 'package:cindchat/presentation/pages/cubit/sync/sync_cubit.dart';
import 'package:cindchat/shared/storage.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/local/chat_local_datasource.dart';

final locator = GetIt.instance;

void init() {
  // Storage
  locator.registerLazySingleton(() => Storage("cindchat"));

  // Data Source
  locator.registerLazySingleton<SyncLocalDatasource>(
      () => SyncLocalDatasourceImpl(locator()));
  locator.registerLazySingleton<ChatLocalDatasource>(
      () => ChatLocalDatasourceImpl(locator()));

  // Repository
  locator.registerLazySingleton<SyncRepository>(
      () => SyncRepositoryImpl(locator()));
  locator.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(locator()));

  // Use Case
  locator.registerFactory(() => SyncDummyData(locator()));
  locator.registerFactory(() => GetAllChatHistory(locator()));
  locator.registerFactory(() => AddChatData(locator()));

  // Cubit
  locator.registerFactory(() => SyncCubit(locator()));
  locator.registerFactory(() => ChatCubit(locator(), locator()));
}
