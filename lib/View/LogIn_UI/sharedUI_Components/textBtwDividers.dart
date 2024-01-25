import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';


class TextBtwDividers extends StatelessWidget {
  const TextBtwDividers({
    super.key, required this.inputText,
  });

  final String inputText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1.5,
              color: dividerColor,
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(inputText),
          ),
          Expanded(
            child: Divider(
              thickness: 1.5,
              color: dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
