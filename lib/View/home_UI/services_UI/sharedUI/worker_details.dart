import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class WorkerDetails extends StatelessWidget {
  final String? service;
  final String? name;
  final String? pricePkr;
  final String? imagePath;
  const WorkerDetails({
    super.key,
    this.service,
    this.name,
    this.pricePkr,
    this.imagePath
    });

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
          "Worker Details",
          style: TextStyle(
            color: electricianServiceAppBarTextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: widgetHeight(350),
              width: double.infinity,
              color: const Color(0x6047a3d4),
              child: Column(
                children: [
                  SizedBox(
                    height: widgetHeight(20),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      imagePath.toString(),
                      fit: BoxFit.cover,
                      height: widgetHeight(200),
                      width: widgetWidth(150),
                    ),
                  ),
                  SizedBox(
                    height: widgetHeight(20),
                  ),
                  Text(
                    name.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: widgetHeight(10),
                  ),
                  Text(
                    service.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: widgetHeight(60),
            ),
            Padding(
              padding: EdgeInsets.only(left: widgetWidth(110)),
              child: Row(
                children: [
                  Icon(
                    Icons.money,
                    size: 35,
                    color: electricianServiceAppBarBackGroundColor,
                  ),
                  SizedBox(
                    width: widgetWidth(50),
                  ),
                  Text(
                    "${pricePkr.toString()} Pkr",
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
