import 'package:bloc/bloc.dart';
import 'package:cindchat/domain/entities/chat.dart';
import 'package:cindchat/domain/usecases/chat/add_chat_data.dart';
import 'package:cindchat/domain/usecases/chat/get_all_chat_history.dart';
import 'package:cindchat/shared/snackbar_handler.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._getAllChatHistory, this._addChatData) : super(ChatInitial());

  final GetAllChatHistory _getAllChatHistory;
  final AddChatData _addChatData;

  void fetchAllChatHistory() async {
    emit(ChatLoading());
    var result = await _getAllChatHistory.execute();

    result.fold((failed) {
      emit(ChatFailed(failed.message));
      SnackbarHandler.showErrorSnackBar(failed.message);
    }, (data) {
      data.sort((a, b) => a.timestamp!.compareTo(b.timestamp!));
      emit(ChatLoaded(data));
    });
  }

  void addChatData(String message, List<Chat> data) async {
    var newData = Chat(
        body: message,
        from: "A",
        to: "B",
        id: data.last.id! + 1,
        timestamp: DateTime.now());

    var result = await _addChatData.execute(newData);

    result.fold((failed) {
      emit(ChatFailed(failed.message));
      SnackbarHandler.showErrorSnackBar(failed.message);
    }, (data) {
      fetchAllChatHistory();
    });
  }
}
