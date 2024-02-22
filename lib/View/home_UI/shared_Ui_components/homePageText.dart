import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';

class HomePageText extends StatelessWidget {
  const HomePageText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: homePageTextColor,
          fontFamily: 'Poppins'
        ),
      ),
    );
  }
}
