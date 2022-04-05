import 'dart:convert';

import 'package:cindchat/data/models/chat_model.dart';
import 'package:cindchat/shared/failure.dart';
import 'package:cindchat/shared/storage.dart';

abstract class ChatLocalDatasource {
  Future<List<ChatModel>?> getAllHistoryChat();
  Future<void> addDataChat(ChatModel data);
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

  @override
  Future<void> addDataChat(ChatModel data) async {
    try {
      var _data = await _storage.getData(key: "chat");
      if (_data == null) {
        var _newData = {
          "data": [data.toMap()]
        };
        await _storage.putData(key: "chat", data: _newData);
      } else {
        _data = jsonDecode(_data);
        _data["data"]?.add(data.toMap());
        await _storage.putData(key: "chat", data: _data);
      }
    } catch (e) {
      throw DatabaseFailure(e.toString());
    }
  }
}
