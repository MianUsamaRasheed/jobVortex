import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/constant.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/cleaningIntro.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Add a delay of seconds (adjust as needed)
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the main page after the delay
      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: const CleaningIntro()));
    });

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: splash_Background_Color,
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(
                child: Image.asset('images/splashPic.jpg'),
              ),
              SizedBox(
                width: widgetWidth(15),
              ),
              Text(
                "jobVortex",
                style: TextStyle(
                  color: splash_title_color,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
