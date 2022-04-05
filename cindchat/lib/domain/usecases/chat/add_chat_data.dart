import 'package:cindchat/domain/entities/chat.dart';
import 'package:cindchat/domain/repositories/chat_repository.dart';
import 'package:cindchat/shared/failure.dart';
import 'package:dartz/dartz.dart';

class AddChatData {
  final ChatRepository _chatRepository;

  AddChatData(this._chatRepository);

  Future<Either<Failure, void>> execute(Chat data) {
    return _chatRepository.addChatData(data);
  }
}
