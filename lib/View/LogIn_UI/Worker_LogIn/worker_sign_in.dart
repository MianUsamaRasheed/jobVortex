import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobvortex/Controller/worker_data_controller.dart';
import 'package:jobvortex/Controller/worker_navigation_controller.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/custom_widgets/fade_in.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/LogIn_UI/Worker_LogIn/worker_sign_up.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/customTextField.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/login_screen_button.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/textBtwDividers.dart';
import 'package:jobvortex/View/LogIn_UI/signUp.dart';
import 'package:provider/provider.dart';
import 'package:jobvortex/main.dart';

class WorkerSignIn extends StatefulWidget {

  const WorkerSignIn({super.key});

  @override
  State<WorkerSignIn> createState() => _WorkerSignInState();
}

class _WorkerSignInState extends State<WorkerSignIn> {

  String? errorMessage = '';
  bool isLogin = false;
  String userEmail = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginTheUser() async {
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.of(context, rootNavigator: true).pop();

      FirebaseFirestore.instance
          .collection("Worker_User")
          .doc(userCredential.user!.uid)
          .get()
          .then((doc) {
        if (doc.exists) {
          String userName = doc.get('Name');
          String id = userCredential.user!.uid;
          final provider = Provider.of<UserModel>(navigatorKey.currentContext!, listen: false);
          provider.setWorkerName(userName);
          provider.setUserID(id);
          provider.setImageUrl(doc.get('imageUrl'));
          provider.setWorkerEmail(doc.get('Email'));
          provider.setWorkerNumber(doc.get('PhoneNumber'));

        } else {
          print('Document does not exist');
        }
      }).catchError((error) {
        print('Error retrieving user name: $error');
      });
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => WorkerNavigationController(
            )));
      } on FirebaseAuthException catch (e) {
      // Dismiss the loading circle
      Navigator.of(context, rootNavigator: true).pop();
      // Handling different FirebaseAuthException error codes
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'invalid-credential':
          errorMessage = 'Wrong password or username provided for that user.';
          break;

        default:
        // Handle unexpected error codes
          errorMessage = 'An unexpected error occurred. Please try again.';
          break;
      }
      print("FirebaseAuthException caught: ${e.code}");
      showSnackbar(errorMessage);
    }
  }


  void showSnackbar(String errorMessage) {
    final snackBar = SnackBar(
      content: Text(errorMessage),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  googleButtonClick() {
    signInWithGoogle().then((user) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const WorkerNavigationController()));
    });
  }

  signInWithGoogle() async {
    //Sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth detail from user
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create credential for the user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //finally lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  facebookButtonClick() {
    signInWithFacebook().then((user) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const WorkerNavigationController()));
    });
  }

  Future<UserCredential?> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult? loginResult = await FacebookAuth.instance.login(permissions: ["public_profile", "email"]).then((value) async {
      await FacebookAuth.instance.getUserData();
    });

    if (loginResult != null) {
      // Check if loginResult.accessToken is not null before accessing its properties
      final AccessToken? accessToken = loginResult.accessToken;
      if (accessToken != null) {
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(accessToken.token);

        // Once signed in, return the UserCredential
        return await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      } else {
        // Handle the case where accessToken is null
        print('Access token is null');
        return null;
      }
    } else {
      // Handle the case where loginResult is null
      print('Login result is null');
      return null;
    }
  }



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
                    loginTheUser();
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
                          MaterialPageRoute(builder: (context) => const WorkerSignUp()),
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