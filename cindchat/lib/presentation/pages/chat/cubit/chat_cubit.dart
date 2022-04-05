import 'package:bloc/bloc.dart';
import 'package:cindchat/domain/entities/chat.dart';
import 'package:cindchat/domain/usecases/chat/get_all_chat_history.dart';
import 'package:cindchat/shared/snackbar_handler.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._getAllChatHistory) : super(ChatInitial());

  final GetAllChatHistory _getAllChatHistory;

  void fetchAllChatHistory() async {
    var result = await _getAllChatHistory.execute();

    result.fold((failed) {
      emit(ChatFailed(failed.message));
      SnackbarHandler.showErrorSnackBar(failed.message);
    }, (data) {
      data.sort((a, b) => a.timestamp!.compareTo(b.timestamp!));
      emit(ChatLoaded(data));
    });
  }
}
