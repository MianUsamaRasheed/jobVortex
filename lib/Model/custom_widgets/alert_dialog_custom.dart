import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';

class AlertRow extends StatelessWidget {
  final String text;
  final String leadingText;
  const AlertRow({super.key, required this.text, required this.leadingText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PoppinsTextStyle(
            text: leadingText, textSize: 18, color: Colors.grey, isBold: true),
        PoppinsTextStyle(
            text: text, textSize: 18, color: Colors.black, isBold: false),
      ],
    );
  }
}
