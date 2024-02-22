import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5FF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: widgetHeight(150),
                  width: widgetWidth(double.infinity),
                  color: blueAppThemeColor,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: widgetHeight(100), left: widgetWidth(140)),
                  child: ClipOval(
                    child: Image.asset(
                      "images/myimage.jpg",
                      height: widgetHeight(110),
                      width: widgetWidth(110),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: widgetHeight(40),
            ),
            DummyGreyContainer(
                heightD: widgetHeight(40),
                widthD: widgetWidth(double.infinity),
                colorVisible: false,
                child: const PoppinsTextStyle(
                    text: "Job Location : ",
                    textSize: 20,
                    color: Colors.grey,
                    isBold: true)),
            DummyGreyContainer(
                heightD: widgetHeight(50),
                widthD: widgetWidth(double.infinity),
                colorVisible: false,
                child: const PoppinsTextStyle(
                    text: "Bahria Town Phase 4 Rawalpindi",
                    textSize: 20,
                    color: Colors.black,
                    isBold: false)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const PoppinsTextStyle(
                    text: "Job title : ",
                    textSize: 20,
                    color: Colors.grey,
                    isBold: true),
                SizedBox(
                  width: widgetWidth(10),
                ),
                const PoppinsTextStyle(
                    text: "Electrician",
                    textSize: 20,
                    color: Colors.black,
                    isBold: false),
              ],
            ),
            SizedBox(
              height: widgetHeight(20),
            ),
            Padding(
              padding: EdgeInsets.only(top: widgetHeight(364)),
              child: Container(
                height: widgetHeight(60),
                width: widgetWidth(double.infinity),
                decoration: BoxDecoration(
                  color: blueAppThemeColor
                ),
                child: const Center(
                  child: PoppinsTextStyle(
                    text: "Accept the Job",
                    textSize: 20,
                    color: Colors.white,
                    isBold: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
