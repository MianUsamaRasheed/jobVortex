import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';


class LoginScreenButton extends StatelessWidget {
  const LoginScreenButton({
    super.key, required this.buttonText, required this.buttonClicked,
  });

  final String buttonText;
  final VoidCallback buttonClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: GestureDetector(
        onTap: buttonClicked,
        child: Container(
            height: 63,
            decoration: BoxDecoration(
              color: logInScreenButtonColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: logInScreenButtonTextColor,
                  fontSize: 18,
                ),
              ),
            )

        ),
      ),
    );
  }
}