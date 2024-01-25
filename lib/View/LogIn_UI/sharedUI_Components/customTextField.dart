import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';

TextField customTextField(String fieldText) {
  String text = fieldText;
  return TextField(
    decoration: InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),

      ),
      hintText: text,
      hintStyle: TextStyle(
        color: textFieldBorderColor,
      ),

    ),
  );
}
