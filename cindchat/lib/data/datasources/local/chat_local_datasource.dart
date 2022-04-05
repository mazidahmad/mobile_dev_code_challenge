import 'dart:convert';

import 'package:cindchat/data/models/chat_model.dart';
import 'package:cindchat/shared/failure.dart';
import 'package:cindchat/shared/storage.dart';

abstract class ChatLocalDatasource {
  Future<List<ChatModel>?> getAllHistoryChat();
}

class ChatLocalDatasourceImpl extends ChatLocalDatasource {
  final Storage _storage;

  ChatLocalDatasourceImpl(this._storage);

  @override
  Future<List<ChatModel>?> getAllHistoryChat() async {
    try {
      var listData = <ChatModel>[];
      var data = await _storage.getList(key: "chat");
      if (data != null) {
        data = jsonDecode(data);
        data['data'].forEach((v) {
          listData.add(ChatModel.fromMap(v));
        });
      }
      return listData;
    } catch (e) {
      throw DatabaseFailure(e.toString());
    }
  }
}
