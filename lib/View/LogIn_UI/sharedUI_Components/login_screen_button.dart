import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';


class LoginScreenButton extends StatelessWidget {
  const LoginScreenButton({
    super.key, required this.buttonText,
  });

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
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