import 'package:cindchat/presentation/themes/app_text.dart';
import 'package:flutter/material.dart';

class BubbleContentMessage extends StatelessWidget {
  const BubbleContentMessage({Key? key, required this.message})
      : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: AppText.subheading,
    );
  }
}
