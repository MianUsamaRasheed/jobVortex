import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/Model/utils/colors.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({super.key, required this.num, required this.onClick});
  final int num;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Maid",
      "Electrician",
      "HVAC technician",
      "Plumber"
    ];
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(20),
        ),

        width: widgetWidth(160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset("images/service${num+1}.jpg"),
            ),
            Text(titles[num],
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
