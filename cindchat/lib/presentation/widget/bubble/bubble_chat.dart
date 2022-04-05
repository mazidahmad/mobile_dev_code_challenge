import 'package:cindchat/presentation/themes/app_color.dart';
import 'package:cindchat/presentation/themes/app_text.dart';
import 'package:cindchat/shared/formatter.dart';
import 'package:flutter/material.dart';

class BubbleChat extends StatelessWidget {
  const BubbleChat({
    this.senderName,
    required this.content,
    required this.timeStamp,
    this.isSender = false,
    Key? key,
  }) : super(key: key);

  final String? senderName;
  final DateTime timeStamp;
  final Widget content;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          color: !isSender ? appColor.backgroundMenu : appColor.sDeepPurple,
          borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(15),
              topLeft: isSender
                  ? const Radius.circular(15)
                  : const Radius.circular(0),
              topRight: isSender
                  ? const Radius.circular(0)
                  : const Radius.circular(15),
              bottomRight: const Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (senderName != null)
            Text(
              senderName!,
              style: AppText.subheading.copyWith(color: appColor.primary),
            ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: content,
          ),
          Text(
            Formatter.toTimeFormatter(timeStamp),
            style: AppText.footnote.copyWith(
                color: isSender
                    ? appColor.superLightGrey.withOpacity(0.5)
                    : appColor.nCement),
          ),
        ],
      ),
    );
  }
}
