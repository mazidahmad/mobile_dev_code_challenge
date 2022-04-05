import 'package:cindchat/shared/storage.dart';

abstract class SyncLocalDatasource {
  Future<void> syncChatData(Map<String, dynamic> data);
}

class SyncLocalDatasourceImpl extends SyncLocalDatasource {
  final Storage _storage;

  SyncLocalDatasourceImpl(this._storage);

  @override
  Future<void> syncChatData(Map<String, dynamic> data) async {
    await _storage.putData(key: "chat", data: data);
  }
}
