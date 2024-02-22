import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.text, required this.textFieldIcon, required this.controller});
  final String text;
  final Icon textFieldIcon;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        label: Text(text, style: const TextStyle(fontFamily: "Poppins"),),
        hintStyle: const TextStyle(
          color: textFieldBorderColor,
        ),
        prefixIcon: textFieldIcon,
      ),
    );
  }
}
