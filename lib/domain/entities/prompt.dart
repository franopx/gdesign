import 'package:flutter/material.dart';

class Prompt {
  String text;
  int id = -1;
  Image icon;

  void editPrompt(String newText) {text = newText;}

  Prompt(this.text, this.icon);
}