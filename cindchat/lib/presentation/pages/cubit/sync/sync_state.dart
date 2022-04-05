part of 'sync_cubit.dart';

@immutable
abstract class SyncState {}

class SyncInitial extends SyncState {}

class SyncLoading extends SyncState {}

class SyncDone extends SyncState {}

class SyncFailed extends SyncState {
  final String message;

  SyncFailed(this.message);
}
