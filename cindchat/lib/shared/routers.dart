import 'package:cindchat/presentation/pages/chat/chat_page.dart';
import 'package:get/route_manager.dart';

class Routers {
  static const String chatPage = "/chatPage";

  static List<GetPage> routers = [
    GetPage(name: chatPage, page: () => const ChatPage()),
  ];
}
