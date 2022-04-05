import 'package:cindchat/presentation/themes/app_color.dart';
import 'package:cindchat/presentation/themes/app_text.dart';
import 'package:flutter/material.dart';

class BubbleContentDocument extends StatelessWidget {
  const BubbleContentDocument(
      {Key? key, required this.documentName, this.fileSize, this.fileType})
      : super(key: key);

  final String documentName;
  final String? fileType;
  final String? fileSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: appColor.background.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: appColor.onBackground,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.file_present_outlined,
                color: appColor.background,
              )),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                documentName,
                style: AppText.subheading,
              ),
              Row(
                children: [
                  Text(
                    fileType ?? "PDF",
                    style: AppText.footnote,
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        color: appColor.onBackground,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    fileSize ?? "1.2 MB",
                    style: AppText.footnote,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
