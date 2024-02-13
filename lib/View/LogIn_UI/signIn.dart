import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/login_screen_button.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/textBtwDividers.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/customTextField.dart';
import 'package:jobvortex/View/LogIn_UI/signUp.dart';
import 'package:jobvortex/Controller/navigationController.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: signInBackGroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: widgetHeight(20),
              ),
              const Icon(
                Icons.lock_outline,
                size: 100,
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              Text(
                "Welcome back you've been missed!",
                style: TextStyle(
                  color: textColorSignInScreen,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: widgetHeight(50),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widgetWidth(30)),
                child: const CustomTextField(
                  text: "User Email",
                  textFieldIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: widgetHeight(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widgetWidth(30)),
                child: const CustomTextField(
                  text: "Password",
                  textFieldIcon: Icon(Icons.lock),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
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
              LoginScreenButton(
                buttonText: "Sign In",
                buttonClicked: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NavigationController(),),
                  );
                },
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              const TextBtwDividers(
                inputText: "OR",
              ),
              SizedBox(
                height: widgetHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthTile(
                    ImagePath: 'icons/google.png',
                    onTap: () {}
                    ),
                    SizedBox(
                      width: widgetWidth(20),
                    ),
                  AuthTile(ImagePath: 'icons/facebook.png', onTap: () {})
                ],
              ),
              SizedBox(
                height: widgetHeight(25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text(
                      "'Register here'",
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
    );
  }
}
