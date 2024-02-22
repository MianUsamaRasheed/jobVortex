import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/b_button.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class LoginScreenButton extends StatelessWidget {
  const LoginScreenButton({
    super.key,
    required this.buttonText,
    required this.buttonClicked,
  });

  final String buttonText;
  final VoidCallback buttonClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: BounceButton(
        wHeight: widgetHeight(60),
        wWidth: widgetWidth(130),
        containerColor: Colors.black,
        onTap: buttonClicked,
        cChild: PoppinsTextStyle(
          text: buttonText,
          textSize: 16,
          color: Colors.white,
          isBold: false),
      )
    );
  }
}
