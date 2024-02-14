import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class BillPage extends StatelessWidget {
  const BillPage(
      {super.key, this.service, this.name, this.pricePkr, this.imagePath});

  final String? service;
  final String? name;
  final String? pricePkr;
  final String? imagePath;
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
                  colors: [
                    Color(0xFFBFDDFD),
                    Color(0xFFB0D2FF),
                    Color(0xFF8FDEF3),
                    Color(0xFF9FDBD9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                )
            ),
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
                  colors: [
                    Color(0xFFBFDDFD),
                    Color(0xFFB0D2FF),
                    Color(0xFF8FDEF3),
                    Color(0xFF9FDBD9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                )
            ),
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
                  colors: [
                    Color(0xFFBFDDFD),
                    Color(0xFFB0D2FF),
                    Color(0xFF8FDEF3),
                    Color(0xFF9FDBD9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                )
            ),
            child: CustomOrderListTile(
              leadingText: "Total Bill",
              trailingText: "$pricePkr",
            ),
          ),
        ],
      ),
    );
  }
}


class CustomOrderListTile extends StatelessWidget {
  const CustomOrderListTile({
    super.key, required this.leadingText, required this.trailingText,
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
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        trailingText,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),

    );
  }
}
