import 'package:flutter/material.dart';
import 'package:jobvortex/Controller/worker_navigation_controller.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/custom_widgets/fade_in.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/customTextField.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/login_screen_button.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/textBtwDividers.dart';
import 'package:jobvortex/View/LogIn_UI/signUp.dart';

class WorkerSignIn extends StatefulWidget {

  const WorkerSignIn({super.key});

  @override
  State<WorkerSignIn> createState() => _WorkerSignInState();
}

class _WorkerSignInState extends State<WorkerSignIn> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                height: widgetHeight(30),
              ),
              const FadeInAnimation(
                delay: 1.2,
                child: Icon(
                  Icons.lock_outline,
                  size: 100,
                ),
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              FadeInAnimation(
                delay: 1.4,
                child: Text(
                  "Worker Panel!",
                  style: TextStyle(
                    color: textColorSignInScreen,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',

                  ),
                ),
              ),
              SizedBox(
                height: widgetHeight(50),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widgetWidth(30)),
                child: FadeInAnimation(
                  delay: 1.6,
                  child: CustomTextField(
                    text: "User Email",
                    textFieldIcon: const Icon(Icons.email),
                    controller: emailController,

                  ),
                ),
              ),
              SizedBox(
                height: widgetHeight(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widgetWidth(30)),
                child: FadeInAnimation(
                  delay: 1.8,
                  child: CustomTextField(
                    text: "Password",
                    textFieldIcon: const Icon(Icons.lock),
                    controller: passwordController,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeInAnimation(
                      delay: 2.0,
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: forgetPasswordTextColor,
                          fontFamily: 'Poppins'
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: widgetHeight(25),
              ),
              FadeInAnimation(
                delay: 2.2,
                child: LoginScreenButton(
                  buttonText: "Sign In",
                  buttonClicked: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkerNavigationController(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: widgetHeight(30),
              ),
              const FadeInAnimation(
                delay: 2.4,
                child: TextBtwDividers(
                  inputText: "OR",
                ),
              ),
              SizedBox(
                height: widgetHeight(20),
              ),
              FadeInAnimation(
                delay: 2.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthTile(ImagePath: 'icons/google.png', onTap: () {}),
                    SizedBox(
                      width: widgetWidth(20),
                    ),
                    AuthTile(ImagePath: 'icons/facebook.png', onTap: () {})
                  ],
                ),
              ),
              SizedBox(
                height: widgetHeight(25),
              ),
              FadeInAnimation(
                delay: 2.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const PoppinsTextStyle(
                      text: "Don't have account? ",
                      color: Colors.black,
                      textSize: 13,
                      isBold: false,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUp()),
                        );
                      },
                      child: const PoppinsTextStyle(
                      text: "Register here ",
                      color: Colors.blue,
                      textSize: 13,
                      isBold: false,
                    ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}