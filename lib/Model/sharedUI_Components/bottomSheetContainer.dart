import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/b_button.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
    required this.textData,
    required this.onPressed,
  });
  final Widget textData;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Container(
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
      padding: EdgeInsets.only(
        top: widgetHeight(40),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: widgetHeight(50),
                bottom: widgetHeight(50),
                left: widgetWidth(50),
                right: widgetWidth(50)),
            child: textData
          ),
          BounceButton(
            onTap: onPressed,
            cChild: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PoppinsTextStyle(
                  text: "Next",
                  textSize: 22,
                  color: Colors.black,
                  isBold: true),
                  SizedBox(
                    width: widgetWidth(10),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
            wHeight: widgetHeight(70),
            wWidth: widgetWidth(130),
            containerColor: Colors.blue)
        ],
      ),
    );
  }
}
