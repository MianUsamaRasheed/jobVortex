import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/fade_in.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/LogIn_UI/Worker_LogIn/worker_sign_in.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/customTextField.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/login_screen_button.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/textBtwDividers.dart';


class WorkerSignUp extends StatefulWidget {
  const WorkerSignUp({super.key});

  @override
  State<WorkerSignUp> createState() => _WorkerSignUpState();
}

class _WorkerSignUpState extends State<WorkerSignUp> {

  final nameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  late String errorMessage;

  void createTheUser() async {
    // Show loading circle
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      // Login the user
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      User? user = userCredential.user;
      if (user != null) {
        final worker_user = FirebaseFirestore.instance.collection("Worker_User");
        await worker_user.doc(user.uid).set({
          "Name": nameController.text,
          "PhoneNumber": mobileNumberController.text,
          "Email": emailController.text,
          "Password": passwordController.text,
        });
        await worker_user.doc(user.uid).collection("JobsReceived").doc().set({

        });
      } else {
        errorMessage = "User creation failed";
        showSnackbar(errorMessage);
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                WorkerSignIn()),
      );
    } on FirebaseAuthException catch (e) {
      // Dismiss the loading circle
      Navigator.of(context, rootNavigator: true).pop();

      // Handling different FirebaseAuthException error codes
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'email-already-in-use':
          errorMessage = 'Email already in-use';
          break;
        default:
        // Handle unexpected error codes
          errorMessage = 'An unexpected error occurred. Please try again.';
          break;
      }
      print("FirebaseAuthException caught: ${e.code}");
      showSnackbar(errorMessage);
    } finally {
      if (mounted) {
        // Check if the loading circle is still present, then dismiss it
        if (Navigator.canPop(context)) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WorkerSignIn()),
          );
        }
      }
    }

  }
  void showSnackbar(String errorMessage) {
    final snackBar = SnackBar(
      content: Text(errorMessage),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }





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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: FadeInAnimation(
                    delay: 1.6,
                    child: CustomTextField(
                      text: "User Name",
                      textFieldIcon: const Icon(Icons.person),
                      controller: nameController,
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(10),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: FadeInAnimation(
                    delay: 1.8,
                    child: CustomTextField(
                      text: "Phone number",
                      textFieldIcon: const Icon(Icons.phone),
                      controller: mobileNumberController,
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(10),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: FadeInAnimation(
                    delay: 2.0,
                    child: CustomTextField(
                      text: "Email_ID",
                      textFieldIcon: const Icon(Icons.email),
                      controller: emailController,
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetHeight(10),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: FadeInAnimation(
                    delay: 2.2,
                    child: CustomTextField(
                      text: "Password",
                      textFieldIcon: const Icon(Icons.lock),
                      controller: passwordController,
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
                     createTheUser();
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
                                builder: (context) => const WorkerSignIn()),
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
