import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class TransactionTileContainer extends StatelessWidget {
  final Color inoutFunds;
  final Color inoutFundsIconColor;
  final bool isIncoming;
  final String textName;
  final String dateHour;
  final String dateMin;
  final String plusorminus;
  final String pkr;
  const TransactionTileContainer(
      {super.key,
      required this.inoutFunds,
      required this.isIncoming,
      required this.inoutFundsIconColor,
      required this.textName,
      required this.dateHour,
      required this.dateMin,
      required this.plusorminus,
      required this.pkr});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Padding(
      padding: EdgeInsets.only(right: widgetWidth(10), left: widgetWidth(10)),
      child: SizedBox(
        height: widgetHeight(70),
        width: widgetWidth(double.infinity),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: widgetHeight(40),
              width: widgetWidth(45),
              decoration: BoxDecoration(
                  color: inoutFunds, borderRadius: BorderRadius.circular(15)),
              child: Icon(
                (isIncoming == true) ? Icons.transit_enterexit_rounded : Icons.arrow_outward_rounded,
                color: inoutFundsIconColor,
                size: 35,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: widgetHeight(20), right: widgetWidth(80)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsTextStyle(
                      text: textName,
                      textSize: 20,
                      color: Colors.black,
                      isBold: true),
                  Padding(
                    padding: EdgeInsets.only(right: widgetWidth(96)),
                    child: PoppinsTextStyle(
                        text: "$dateHour:$dateMin PM",
                        textSize: 15,
                        color: Colors.grey,
                        isBold: false),
                  ),
                ],
              ),
            ),
            PoppinsTextStyle(
                text: "${plusorminus}Rs. $pkr",
                textSize: 15,
                color: (isIncoming == true) ? incomingFundsIconColor : outcomingFundsIconColor,
                isBold: true)
          ],
        ),
      ),
    );
  }
}


List<Color> backContainerColor = [
  incomingFunds,
  outcomingFunds
];

List<Color> iconContainerColor = [
  incomingFundsIconColor,
  outcomingFundsIconColor
];

List<bool> incomingOutGoing = [
  true,
  false
];

List<String> name = [
  "Bahria Town",
  "Company Tax"
];

List<String> hourly = [
  "9",
  "2"
];

List<String> minutes = [
  "38",
  "21"
];

List<String> sign = [
  "+",
  "-"
];

List<String> pay = [
  "700",
  "376"
];