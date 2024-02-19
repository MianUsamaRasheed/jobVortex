import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/sharedUI_Components/bottomSheetContainer.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/Hierarchy/hierarchy.dart';
import 'package:page_transition/page_transition.dart';

class PlumberIntro extends StatelessWidget {
  const PlumberIntro({super.key});

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
              child: Image.asset('images/plumberIntro.jpg'),
            ),
            SizedBox(
              height: widgetHeight(16),
            ),
            Expanded(
              child: BottomSheetContainer(
                textData: const PoppinsTextStyle(
                    text:
                        "Find custom plumbing solutions for leaks, clogs, and more from our skilled professional network.",
                    textSize: 22,
                    color: Colors.white,
                    isBold: false,),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const HierarchyScreen(),
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
