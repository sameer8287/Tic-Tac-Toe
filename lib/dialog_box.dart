import 'package:flutter/material.dart';

class custom_dialog extends StatelessWidget {
  late final title;
  late final content;
  late final VoidCallback callback;
  late final actionText;

  custom_dialog(this.title, this.content, this.callback,
      [this.actionText = "Reset"]);
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          ElevatedButton(
            onPressed: callback,
            // Color: Colors.white,
            child: new Text(actionText),
          )
        ]);
  }
}
