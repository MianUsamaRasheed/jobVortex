import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/sharedUI_Components/bottomSheetContainer.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:page_transition/page_transition.dart';
import 'package:jobvortex/View/LogIn_UI/signIn.dart';

class PlumberIntro extends StatelessWidget {
  const PlumberIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cleaning_intro_color,
        body: Column(
          children: [
            SizedBox(
              child: Image.asset('images/plumberIntro.jpg'),
            ),
            SizedBox(
              height: widgetHeight(16),
            ),
            Expanded(
              child: BottomSheetContainer(
                textData: "Explore a variety of customized solutions for your plumbing needs. Our network links you with skilled professionals ready to handle leaks, clogs, and plumbing issues of any size.",
                onPressed: (){
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const SignIn(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
