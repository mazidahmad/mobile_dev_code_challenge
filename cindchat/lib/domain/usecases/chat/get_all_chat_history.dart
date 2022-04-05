import 'package:cindchat/domain/entities/chat.dart';
import 'package:cindchat/domain/repositories/chat_repository.dart';
import 'package:cindchat/shared/failure.dart';
import 'package:dartz/dartz.dart';

class GetAllChatHistory {
  final ChatRepository _chatRepository;

  GetAllChatHistory(this._chatRepository);

  Future<Either<Failure, List<Chat>>> execute() {
    return _chatRepository.getAllChatHistory();
  }
}
