import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/login_screen_button.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/textBtwDividers.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/customTextField.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: signInBackGroundColor,
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: widgetHeight(70),
                ),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(
                  height: widgetHeight(50),
                ),
                Text(
                  "Welcome back you've been missed!",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: widgetHeight(50),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: customTextField(
                      "UserName"
                  ),
                ),
                SizedBox(
                  height: widgetHeight(10),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: customTextField(
                      "Password"
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: forgetPasswordTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: widgetHeight(25),
                ),
                const LoginScreenButton(
                  buttonText: "Sign IN",
                ),
                SizedBox(
                  height: widgetHeight(50),
                ),

                const TextBtwDividers(
                  inputText: "Don't have Account?",
                ),

                SizedBox(
                  height: widgetHeight(20),
                ),

                const LoginScreenButton(buttonText: "SignUp"),

              ],
            ),
          ),
        ),
      ),
    );
  }
}