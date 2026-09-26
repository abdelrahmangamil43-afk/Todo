import 'package:flutter/material.dart';

abstract class AppDialog {
  static Future<void> showLoading(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            spacing: 20,
            children: [
              CircularProgressIndicator(),
              Text(
                "Loading ...",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        );
      },
    );
  }
}
