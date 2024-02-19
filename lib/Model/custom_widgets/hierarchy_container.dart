import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/b_button.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class HContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const HContainer({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return BounceButton(
        onTap: onTap,
        cChild: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PoppinsTextStyle(
                text: text,
                textSize: 19,
                color: Colors.white,
                isBold: false),
            SizedBox(
              width: widgetWidth(10),
            ),
            const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            )
          ],
        ),
        wHeight: widgetHeight(60),
        wWidth: widgetWidth(250),
        containerColor: Colors.black);
  }
}
