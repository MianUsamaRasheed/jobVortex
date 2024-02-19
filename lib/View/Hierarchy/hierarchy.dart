import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/hierarchy_container.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/LogIn_UI/Worker_LogIn/worker_sign_in.dart';
import 'package:jobvortex/View/LogIn_UI/signIn.dart';

class HierarchyScreen extends StatelessWidget {
  const HierarchyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: widgetHeight(100),
              left: widgetWidth(15),
              right: widgetWidth(15)),
          child: Column(
            children: [
              Container(
                height: widgetHeight(300),
                width: widgetWidth(300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Image.asset('images/splashPic-removebg-preview.png'),
              ),
              SizedBox(
                height: widgetHeight(60),
              ),
              Column(
                children: [
                  HContainer(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      },
                      text: "Client"),
                      SizedBox(
                        height: widgetHeight(20),
                      ),
                  HContainer(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WorkerSignIn()));
                      },
                      text: "Worker")
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
