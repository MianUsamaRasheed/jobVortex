import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/customTextField.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/login_screen_button.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/textBtwDividers.dart';
import 'package:jobvortex/View/LogIn_UI/signIn.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: signUpBackGroundColor,
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: widgetHeight(20),
                ),
                const Icon(
                  Icons.lock_open_rounded,
                  size: 100,
                ),
                SizedBox(
                  height: widgetHeight(30),
                ),
                Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    color: textColorSignUpScreen,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"
                  ),
                ),
                SizedBox(
                  height: widgetHeight(50),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomTextField(
                    text: "User Name",
                    textFieldIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(10),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomTextField(
                    text: "Phone number",
                    textFieldIcon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(10),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomTextField(
                    text: "Email_ID",
                    textFieldIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(10),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomTextField(
                    text: "Password",
                    textFieldIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(40),
                ),
                LoginScreenButton(
                  buttonText: "Sign Up",
                  buttonClicked: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                ),
                SizedBox(
                  height: widgetHeight(30),
                ),
                const TextBtwDividers(inputText: "OR"),
                SizedBox(
                  height: widgetHeight(30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                        );
                      },
                      child: const Text(
                        "'LogIn'",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
