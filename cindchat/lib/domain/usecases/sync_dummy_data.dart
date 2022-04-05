import 'package:cindchat/domain/repositories/sync_repository.dart';
import 'package:cindchat/shared/failure.dart';
import 'package:dartz/dartz.dart';

class SyncDummyData {
  final SyncRepository _repository;

  SyncDummyData(this._repository);

  Future<Either<Failure, void>> execute(Map<String, dynamic> data) {
    return _repository.syncDummyData(data);
  }
}
