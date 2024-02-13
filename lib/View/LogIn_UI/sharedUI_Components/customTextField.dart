import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.text, required this.textFieldIcon});
  final String text;
  final Icon textFieldIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        hintText: text,
        hintStyle: const TextStyle(
          color: textFieldBorderColor,
        ),
        prefixIcon: textFieldIcon,
      ),
    );
  }
}
