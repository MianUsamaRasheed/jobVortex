import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class IncomingJobsAlert extends StatelessWidget {
  final String jobText;
  final String jobType;
  final VoidCallback onTap;
  const IncomingJobsAlert({super.key, required this.jobText, required this.jobType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: widgetHeight(110),
        width: widgetWidth(200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DummyGreyContainer(
                  heightD: widgetHeight(30),
                  widthD: widgetWidth(260),
                  colorVisible: false,
                  child: Text(
                    jobText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 19, fontFamily: 'Poppins'),
                  ),
                ),
                DummyGreyContainer(
                  heightD: widgetHeight(30),
                  widthD: widgetWidth(270),
                  colorVisible: false,
                  child: Row(
                    children: [
                      const PoppinsTextStyle(
                          text: "Job Type: ",
                          textSize: 15,
                          color: Colors.grey,
                          isBold: true),
                      PoppinsTextStyle(
                          text: jobType,
                          textSize: 16,
                          color: Colors.black,
                          isBold: false),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: widgetHeight(40),
              width: widgetWidth(40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: blueAppThemeColor),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  )),
            ),
            Container(
              height: widgetHeight(40),
              width: widgetWidth(40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: blueAppThemeColor, width: 2)),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> job = [
  "Bahria Town Phase 4 Rawalpindi",
  "E11/4 E11 Islamabad"
];

List<String> typeJob = [
  "Electrician",
  "Plumbing"
];
