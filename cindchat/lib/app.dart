import 'package:cindchat/presentation/pages/chat/chat_page.dart';
import 'package:cindchat/presentation/themes/app_theme.dart';
import 'package:cindchat/shared/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chindchat',
      theme: AppTheme.darkTheme,
      getPages: Routers.routers,
      initialRoute: Routers.chatPage,
    );
  }
}
