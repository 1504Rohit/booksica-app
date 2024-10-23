import 'package:flutter/material.dart';

class CustSnackbar {
  static void showCustomSnackbar({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(top: 50, left: 10, right: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
