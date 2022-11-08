import 'package:flutter/material.dart';

class GameBtn {
  late final id;
  late String text;
  late Color bg;
  late bool enable;

  GameBtn({
    this.id,this.text="",this.bg = Colors.grey,this.enable = true
  });
}
