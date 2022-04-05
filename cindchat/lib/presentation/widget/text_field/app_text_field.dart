import 'package:cindchat/presentation/themes/app_color.dart';
import 'package:cindchat/presentation/themes/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final bool isObscured;
  final bool isTextArea;
  final TextAlign textAlign;
  final bool isDisabled;
  final TextInputType? keyboardType;
  final void Function(String?)? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  const AppTextField(
      {Key? key,
      this.controller,
      this.hint,
      this.isObscured = false,
      this.isTextArea = false,
      this.isDisabled = false,
      this.keyboardType,
      this.onTap,
      this.validator,
      this.onChanged,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appColor.background,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        onTap: onTap,
        readOnly: onTap != null ? true : false,
        enabled: !isDisabled,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.multiline,
        maxLines: isTextArea ? null : 1,
        minLines: isTextArea ? 5 : null,
        textAlign: textAlign,
        obscureText: isObscured,
        onChanged: onChanged,
        validator: validator,
        style: AppText.subheading,
        decoration: InputDecoration(
          focusColor: appColor.background,
          hoverColor: appColor.background,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: appColor.background),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: appColor.background)),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: appColor.background),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: appColor.background),
          ),
          fillColor: appColor.background,
          hintText: hint,
          hintStyle: AppText.subheading,
        ),
      ),
    );
  }
}
