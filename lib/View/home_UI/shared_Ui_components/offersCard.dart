import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/Model/utils/colors.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({super.key, required this.num});
  final int num;
  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Flat 25% discount coming soon here 😍",
      "Our new Service coming 🥰 ",
    ];
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
      ),

      width: widgetWidth(220),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/offers${num+1}.jpg"),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 8),
            child: Text(titles[num],
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
