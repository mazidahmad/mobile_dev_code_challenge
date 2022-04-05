import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cindchat/domain/usecases/sync_dummy_data.dart';
import 'package:cindchat/shared/snackbar_handler.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'sync_state.dart';

class SyncCubit extends Cubit<SyncState> {
  SyncCubit(this._syncDummyData) : super(SyncInitial());

  final SyncDummyData _syncDummyData;

  void syncDummyData() async {
    try {
      var jsonString =
          await rootBundle.loadString("assets/message_dataset.json");
      var jsonData = jsonDecode(jsonString);

      var result = await _syncDummyData.execute(jsonData);

      result.fold((failed) {
        emit(SyncFailed(failed.message));
        SnackbarHandler.showErrorSnackBar(failed.message);
      }, (_) => emit(SyncDone()));
    } catch (e) {
      emit(SyncFailed(e.toString()));
      SnackbarHandler.showErrorSnackBar(e.toString());
    }
  }
}
