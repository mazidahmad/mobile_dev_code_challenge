import 'package:cindchat/presentation/themes/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewerPage extends StatelessWidget {
  const ImageViewerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "image",
        child: PhotoView(
          imageProvider: NetworkImage(
            Get.arguments["image"],
          ),
          errorBuilder: (context, exception, _) {
            return Center(
              child: Image(
                image: AppAsset.noImage,
              ),
            );
          },
        ),
      ),
    );
  }
}
