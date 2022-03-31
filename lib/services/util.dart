import 'package:bookworms/constants.dart';
import 'package:flutter/material.dart';
import 'package:snack/snack.dart';

class Util {
  showToast(BuildContext context, String message) {
    final bar = SnackBar(content: Text(message));
    bar.show(context);
  }

  showErrorText(String message) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        message,
        style: const TextStyle(color: colorGrey, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    ));
  }
}
