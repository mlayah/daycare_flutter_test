import 'package:flutter/material.dart';

class Helpers {

  // value passed should not be null and not ampty string
  static String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    return null;
  }

  //simplified default decorator class for text fields
  static InputDecoration defaultInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      border: const OutlineInputBorder(),
    );
  }
}
