import 'package:cindchat/data/datasources/local/sync_local_datasource.dart';
import 'package:cindchat/domain/repositories/sync_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:cindchat/shared/failure.dart';

class SyncRepositoryImpl extends SyncRepository {
  final SyncLocalDatasource _localDatasource;

  SyncRepositoryImpl(this._localDatasource);

  @override
  Future<Either<Failure, void>> syncDummyData(Map<String, dynamic> data) async {
    try {
      await _localDatasource.syncChatData(data);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
