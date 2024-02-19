
import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class CustomExpansionWidget extends StatelessWidget {
  final Widget leadingIcon;
  final String titleText;
  final Widget childWidget;
  const CustomExpansionWidget(
      {super.key,
      required this.leadingIcon,
      required this.titleText,
      required this.childWidget});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return ExpansionTile(
      iconColor: blueAppThemeColor,
      backgroundColor: Colors.grey[200],
      leading: leadingIcon,
      title: Text(titleText),
      children: [
        Padding(
            padding: EdgeInsets.only(left: widgetWidth(55)), child: childWidget)
      ],
    );
  }
}
