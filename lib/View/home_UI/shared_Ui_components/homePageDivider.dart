import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/Model/utils/colors.dart';

class HomePageDivider extends StatelessWidget {
  const HomePageDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widgetHeight(20),
      child: const Divider(
        thickness: 2.3,
        color: homePageDividerColor,
      ),
    );
  }
}
