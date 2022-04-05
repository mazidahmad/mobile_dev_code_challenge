import 'package:cindchat/presentation/themes/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryViewerPage extends StatefulWidget {
  const GalleryViewerPage({Key? key}) : super(key: key);

  @override
  State<GalleryViewerPage> createState() => _GalleryViewerPageState();
}

class _GalleryViewerPageState extends State<GalleryViewerPage> {
  List<String> images = Get.arguments['images'];

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(images[index]),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          heroAttributes: const PhotoViewHeroAttributes(tag: 'images'),
          errorBuilder: (context, exception, _) {
            return Image(
              image: AppAsset.noImage,
            );
          },
        );
      },
      itemCount: images.length,
    );
  }
}
