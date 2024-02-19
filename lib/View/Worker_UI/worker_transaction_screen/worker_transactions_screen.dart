import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/custom_widgets/transaction_container.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5FF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueAppThemeColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.white,)),
        title: const PoppinsTextStyle(
            text: "Transactions and Earnings",
            textSize: 19,
            color: Colors.white,
            isBold: false),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: widgetHeight(20),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: widgetWidth(300)),
              child: const PoppinsTextStyle(
                text: "Jan 12",
                textSize: 21,
                color: Colors.grey,
                isBold: false),
            ),
              SizedBox(
                height: widgetHeight(200),
                width: widgetWidth(double.infinity),
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return TransactionTileContainer(
                      inoutFunds: backContainerColor[index],
                      isIncoming: incomingOutGoing[index],
                      inoutFundsIconColor: iconContainerColor[index],
                      textName: name[index],
                      dateHour: hourly[index],
                      dateMin: minutes[index],
                      plusorminus: sign[index],
                      pkr: pay[index]);}
                  ),
              )
          ],
        ),
      ),
    );
  }
}
