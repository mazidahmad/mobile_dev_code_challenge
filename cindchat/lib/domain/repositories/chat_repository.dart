import 'package:cindchat/domain/entities/chat.dart';
import 'package:cindchat/shared/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<Chat>>> getAllChatHistory();
  Future<Either<Failure, void>> addChatData(Chat data);
}
