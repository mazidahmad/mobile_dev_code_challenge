import 'dart:async';

import 'package:cindchat/app.dart';
import 'package:cindchat/bloc_observer.dart';
import 'package:cindchat/presentation/pages/chat/cubit/chat_cubit.dart';
import 'package:cindchat/presentation/pages/cubit/sync/sync_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cindchat/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  var appDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDir.path);

  BlocOverrides.runZoned(() {
    runZonedGuarded(() {
      runApp(MultiBlocProvider(providers: [
        BlocProvider(create: (context) => di.locator<SyncCubit>()),
        BlocProvider(create: (context) => di.locator<ChatCubit>()),
      ], child: const MyApp()));
    }, (error, stackTrace) {});
  }, blocObserver: Observer());
}
