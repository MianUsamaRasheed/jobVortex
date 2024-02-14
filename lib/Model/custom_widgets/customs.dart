import 'package:flutter/material.dart';

class CustomGreyText extends StatelessWidget {
  final String text;
  const CustomGreyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: const TextStyle(
          color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),
    );
  }
}


class AuthTile extends StatelessWidget {
  final String ImagePath;
  final Function()? onTap;
  const AuthTile({super.key, 
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
              border: Border.all(
                  color: Colors.grey.shade200
              ),
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[100]
          ),
          child: Image.asset(
            ImagePath,
            height: 40,
          )
      ),
    );
  }
}