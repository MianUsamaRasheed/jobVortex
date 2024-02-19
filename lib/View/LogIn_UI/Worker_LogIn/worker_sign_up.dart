import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/fade_in.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/customTextField.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/login_screen_button.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/textBtwDividers.dart';
import 'package:jobvortex/View/LogIn_UI/signIn.dart';

class WorkerSignUp extends StatelessWidget {
  const WorkerSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
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
                const FadeInAnimation(
                  delay: 1.2,
                  child: Icon(
                    Icons.lock_open_rounded,
                    size: 100,
                  ),
                ),
                SizedBox(
                  height: widgetHeight(30),
                ),
                FadeInAnimation(
                  delay: 1.4,
                  child: Text(
                    "Let's create an account for you",
                    style: TextStyle(
                        color: textColorSignUpScreen,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(50),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: FadeInAnimation(
                    delay: 1.6,
                    child: CustomTextField(
                      text: "User Name",
                      textFieldIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(10),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: FadeInAnimation(
                    delay: 1.8,
                    child: CustomTextField(
                      text: "Phone number",
                      textFieldIcon: Icon(Icons.phone),
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(10),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: FadeInAnimation(
                    delay: 2.0,
                    child: CustomTextField(
                      text: "Email_ID",
                      textFieldIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(10),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: FadeInAnimation(
                    delay: 2.2,
                    child: CustomTextField(
                      text: "Password",
                      textFieldIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(40),
                ),
                FadeInAnimation(
                  delay: 2.4,
                  child: LoginScreenButton(
                    buttonText: "Sign Up",
                    buttonClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: widgetHeight(30),
                ),
                const FadeInAnimation(
                    delay: 2.6, child: TextBtwDividers(inputText: "OR")),
                SizedBox(
                  height: widgetHeight(30),
                ),
                FadeInAnimation(
                  delay: 2.8,
                  child: Row(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
