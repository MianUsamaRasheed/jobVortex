import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
    required this.textData,
    required this.onPressed,
  });
  final String textData;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: widgetHeight(50),
                bottom: widgetHeight(50),
                left: widgetWidth(50),
                right: widgetWidth(50)),
            child: Text(
              textData,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: widgetWidth(110), right: widgetWidth(110)),
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                padding: EdgeInsets.only(
                    left: widgetWidth(30), right: widgetWidth(30)),
                width: widgetWidth(90),
                height: widgetHeight(60),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
