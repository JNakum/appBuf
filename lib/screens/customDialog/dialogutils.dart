import 'package:flutter/material.dart';

class DialogUtils {
  static void showTextProperties(BuildContext context, String properties) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("TextField Properties.."),
          content: SingleChildScrollView(
            child: Center(child: Text(properties)),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
