import 'package:cindchat/shared/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SyncRepository {
  Future<Either<Failure, void>> syncDummyData(Map<String, dynamic> data);
}
