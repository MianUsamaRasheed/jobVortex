import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/payment_page.dart';

class BillPage extends StatelessWidget {

  const BillPage(

      {super.key, this.service, this.name, this.pricePkr, this.imagePath, this.workerUID});

  final String? service;
  final String? name;
  final String? pricePkr;
  final String? imagePath;
  final String? workerUID;

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return Scaffold(
      backgroundColor: electricianServicePageBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: electricianServiceAppBarIconColor,
        ),
        backgroundColor: electricianServiceAppBarBackGroundColor,
        title: const Text(
          "Order Review",
          style: TextStyle(
            color: electricianServiceAppBarTextColor,
            fontFamily: 'Poppins'
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: widgetHeight(15),
          ),
          Container(
            //color:  const Color(0x6047a3d4),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )),
            child: Column(
              children: [
                const CustomOrderListTile(
                  leadingText: "Service",
                  trailingText: "Electrician",
                ),
                CustomOrderListTile(
                  leadingText: "Service Provider",
                  trailingText: "$name",
                ),
                const CustomOrderListTile(
                  leadingText: "Package",
                  trailingText: "Today",
                ),
              ],
            ),
          ),
          SizedBox(
            height: widgetHeight(15),
          ),
          Container(
            // color:  const Color(0x6047a3d4),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )),
            child: Column(
              children: [
                CustomOrderListTile(
                  leadingText: "Bill",
                  trailingText: "$pricePkr",
                ),
                const CustomOrderListTile(
                  leadingText: "Discount",
                  trailingText: "0",
                ),
              ],
            ),
          ),
          SizedBox(
            height: widgetHeight(15),
          ),
          Container(
            //color:  const Color(0x6047a3d4),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )),
            child: CustomOrderListTile(
              leadingText: "Total Bill",
              trailingText: "$pricePkr",
            ),
          ),
          SizedBox(
            height: widgetHeight(282),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PaymentPage(
                      workerUID: workerUID,
                      pricePkr: pricePkr
                  ),
                ),
              );
            },
            child: Container(
              color: Colors.blue.shade900,
              height: widgetHeight(70),
              width: widgetWidth(double.infinity),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Place Order",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'
                    ),
                  ),
                  SizedBox(
                    width: widgetWidth(15),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomOrderListTile extends StatelessWidget {
  const CustomOrderListTile({
    super.key,
    required this.leadingText,
    required this.trailingText,
  });
  final String leadingText;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        leadingText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins'
        ),
      ),
      trailing: Text(
        trailingText,
        style: const TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins'
        ),
      ),
    );
  }
}
