import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/sharedUI_Components/bottomSheetContainer.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:page_transition/page_transition.dart';
import 'package:jobvortex/View/Introductory_UI/airConditionerIntro.dart';

class ElectricianIntro extends StatelessWidget {
  const ElectricianIntro({super.key});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: cleaning_intro_color,
        body: Column(
          children: [
            SizedBox(
              height: widgetHeight(350),
              width: widgetWidth(350),
              child: Image.asset('images/electricianIntro.jpg'),
            ),
            SizedBox(
              height: widgetHeight(16),
            ),
            Expanded(
              child: BottomSheetContainer(
                textData: "Our hub for all electrical solutions! Discover a spectrum of reliable electrician services tailored to your needs.",
                onPressed: (){
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const AirConditionerIntro(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
