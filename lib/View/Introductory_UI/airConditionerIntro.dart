import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/sharedUI_Components/bottomSheetContainer.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/Introductory_UI/plumberingIntro.dart';
import 'package:page_transition/page_transition.dart';

class AirConditionerIntro extends StatelessWidget {
  const AirConditionerIntro({super.key});

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
              child: Image.asset('images/airConditionerIntro.jpg'),
            ),
            SizedBox(
              height: widgetHeight(6),
            ),
            Expanded(
              child: BottomSheetContainer(
                textData: const PoppinsTextStyle(
                    text:
                        "Our network boasts skilled professionals ready to tackle any AC challenge, ensuring a refreshing and comfortable indoor environment.",
                    textSize: 22,
                    color: Colors.white,
                    isBold: false,),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const PlumberIntro(),
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
