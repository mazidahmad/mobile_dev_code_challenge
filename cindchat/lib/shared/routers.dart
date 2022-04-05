import 'package:cindchat/presentation/pages/chat/chat_page.dart';
import 'package:cindchat/presentation/pages/gallery_viewer_page.dart';
import 'package:cindchat/presentation/pages/image_viewer_page.dart';
import 'package:get/route_manager.dart';

class Routers {
  static const String chatPage = "/chatPage";
  static const String imageViewer = "/imageViewerPage";
  static const String galleryViewer = "/galleryViewerPage";

  static List<GetPage> routers = [
    GetPage(name: chatPage, page: () => const ChatPage()),
    GetPage(name: imageViewer, page: () => const ImageViewerPage()),
    GetPage(name: galleryViewer, page: () => const GalleryViewerPage()),
  ];
}
