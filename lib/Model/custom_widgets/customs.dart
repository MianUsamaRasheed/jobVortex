import 'package:flutter/material.dart';

class CustomGreyText extends StatelessWidget {
  final String text;
  const CustomGreyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: const TextStyle(
          color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
    );
  }
}

class AuthTile extends StatelessWidget {
  final String ImagePath;
  final Function()? onTap;
  const AuthTile({
    super.key,
    required this.ImagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[100]),
          child: Image.asset(
            ImagePath,
            height: 40,
          )),
    );
  }
}

class PoppinsTextStyle extends StatelessWidget {
  final bool isBold;
  final String text;
  final double textSize;
  final Color color;
  const PoppinsTextStyle(
      {super.key,
      required this.text,
      required this.textSize,
      required this.color,
      required this.isBold});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "Poppins",
          fontSize: textSize,
          color: color,
          fontWeight: (isBold == true) ? FontWeight.bold : FontWeight.normal),
    );
  }
}

class ProtestTextStyle extends StatelessWidget {
  final String text;
  final double textSize;
  final Color color;
  const ProtestTextStyle(
      {super.key,
      required this.text,
      required this.textSize,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontFamily: "Protest", fontSize: textSize, color: color),
    );
  }
}

class DummyGreyContainer extends StatelessWidget {
  final double heightD;
  final double widthD;
  final bool colorVisible;
  final Widget child;
  const DummyGreyContainer(
      {super.key,
      required this.heightD,
      required this.widthD,
      required this.colorVisible,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightD,
      width: widthD,
      color: (colorVisible == true) ? Colors.grey[400] : Colors.transparent,
      child: child,
    );
  }
}
