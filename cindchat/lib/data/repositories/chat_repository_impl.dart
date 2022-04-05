import 'package:cindchat/data/datasources/local/chat_local_datasource.dart';
import 'package:cindchat/domain/entities/chat.dart';
import 'package:cindchat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:cindchat/shared/failure.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatLocalDatasource _localDatasource;

  ChatRepositoryImpl(this._localDatasource);

  @override
  Future<Either<Failure, List<Chat>>> getAllChatHistory() async {
    try {
      var result = await _localDatasource.getAllHistoryChat();
      return Right(result?.map((e) => e.toEntity()).toList() ?? []);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
