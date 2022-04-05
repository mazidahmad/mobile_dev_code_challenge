import 'package:cindchat/presentation/themes/app_assets.dart';
import 'package:cindchat/presentation/themes/app_color.dart';
import 'package:cindchat/presentation/themes/app_text.dart';
import 'package:cindchat/shared/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BubbleContentImage extends StatelessWidget {
  const BubbleContentImage({Key? key, required this.imagePaths})
      : super(key: key);

  final List<String> imagePaths;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          SizedBox(
            width: 200,
            child: (imagePaths.length > 3)
                ? GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      childAspectRatio: 1,
                      mainAxisSpacing: 0,
                    ),
                    itemCount: imagePaths.length > 4 ? 4 : imagePaths.length,
                    itemBuilder: (context, idx) {
                      return (imagePaths.length > 4 && idx == 3)
                          ? Stack(
                              alignment: Alignment.center,
                              fit: StackFit.expand,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routers.imageViewer,
                                        arguments: {"image": imagePaths[idx]});
                                  },
                                  child: Hero(
                                    tag: "image",
                                    child: Image(
                                      image: NetworkImage(imagePaths[idx]),
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, exception, _) {
                                        return Image(
                                          image: AppAsset.noImage,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routers.galleryViewer,
                                        arguments: {"images": imagePaths});
                                  },
                                  child: Container(
                                    color: appColor.background.withOpacity(0.7),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons
                                            .photo_size_select_actual_outlined),
                                        Text(
                                          "${imagePaths.length - 4} more",
                                          style: AppText.heading5,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          : GestureDetector(
                              onTap: () {
                                Get.toNamed(Routers.imageViewer,
                                    arguments: {"image": imagePaths[idx]});
                              },
                              child: Hero(
                                tag: "image",
                                child: Image(
                                  image: NetworkImage(imagePaths[idx]),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, exception, _) {
                                    return Image(
                                      image: AppAsset.noImage,
                                    );
                                  },
                                ),
                              ),
                            );
                    })
                : (imagePaths.length == 1)
                    ? GestureDetector(
                        onTap: () {
                          Get.toNamed(Routers.imageViewer,
                              arguments: {"image": imagePaths[0]});
                        },
                        child: Hero(
                          tag: "image",
                          child: Image(
                            image: NetworkImage(imagePaths[0]),
                            fit: BoxFit.cover,
                            errorBuilder: (context, exception, _) {
                              return Image(
                                image: AppAsset.noImage,
                              );
                            },
                          ),
                        ),
                      )
                    : Wrap(
                        children: List.generate(
                            imagePaths.length,
                            (idx) => GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routers.imageViewer,
                                        arguments: {"image": imagePaths[idx]});
                                  },
                                  child: Hero(
                                    tag: "image",
                                    child: Image(
                                      width: (idx < 2) ? 100 : double.infinity,
                                      height: 100,
                                      image: NetworkImage(imagePaths[idx]),
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, exception, _) {
                                        return Image(
                                          image: AppAsset.noImage,
                                        );
                                      },
                                    ),
                                  ),
                                )),
                      ),
          )
        ],
      ),
    );
  }
}
