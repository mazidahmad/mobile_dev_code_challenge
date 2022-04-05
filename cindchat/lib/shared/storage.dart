import 'dart:convert';

import 'package:hive/hive.dart';

class Storage {
  final String boxName;

  Storage(this.boxName);

  Future<void> putJson({required Map<String, dynamic> json}) async {
    Box box = await Hive.openBox(boxName);
    await box.putAll(json);
    await box.close();
    return;
  }

  Future<void> putData(
      {required String key, required Map<String, dynamic> data}) async {
    Box box = await Hive.openBox(boxName);
    final String stringJson = json.encode(data);
    await box.put(key, stringJson);
    await box.close();
    return;
  }

  Future<void> putString({required String key, required String value}) async {
    Box box = await Hive.openBox(boxName);
    await box.put(key, value);
    await box.close();
    return;
  }

  Future<void> putInt({required String key, required int value}) async {
    Box box = await Hive.openBox(boxName);
    await box.put(key, value);
    await box.close();
    return;
  }

  Future<void> putBool({required String key, required bool value}) async {
    Box box = await Hive.openBox(boxName);
    await box.put(key, value);
    await box.close();
    return;
  }

  Future<void> updateBox(
      {required Map<String, dynamic> value, required int index}) async {
    Box box = await Hive.openBox(boxName);
    await box.putAt(index, value);
    await box.close();
    return;
  }

  Future<dynamic> getData({required String key}) async {
    Box box = await Hive.openBox(boxName);
    final value = await box.get(key);
    await box.close();
    return value;
  }

  Future<DateTime?> getDate({required String key}) async {
    Box box = await Hive.openBox(boxName);
    DateTime? date = await box.get(key);
    await box.close();
    return date;
  }

  Future<int?> getInt({required String key}) async {
    Box box = await Hive.openBox(boxName);
    int? value = await box.get(key);
    await box.close();
    return value;
  }

  Future<bool> getBool({required String key}) async {
    Box box = await Hive.openBox(boxName);
    bool? value = await box.get(key);
    await box.close();
    if (value == null) {
      return false;
    } else {
      return value;
    }
  }

  Future<double?> getDouble({required String key}) async {
    Box box = await Hive.openBox(boxName);
    double? value = await box.get(key);
    await box.close();
    return value;
  }

  Future<dynamic> getList({required String key}) async {
    Box box = await Hive.openBox(boxName);
    dynamic value = await box.get(key);
    await box.close();
    return value;
  }

  Future<void> deleteData({required String name}) async {
    Box box = await Hive.openBox(name);
    await box.deleteFromDisk();
    await box.close();
    return;
  }

  Future<void> deleteDataFromKey({required String key}) async {
    Box box = await Hive.openBox(boxName);
    await box.delete(key);
    await box.close();
    return;
  }
}
