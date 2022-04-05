import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHandler {
  static showErrorSnackBar(String message) {
    Get.snackbar("Failed", message,
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red);
  }
}
