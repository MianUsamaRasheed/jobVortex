import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/bill_Page.dart';

class WorkerDetails extends StatelessWidget {
  final String? service;
  final String? name;
  final String? pricePkr;
  final String? imagePath;
  const WorkerDetails(
      {super.key, this.service, this.name, this.pricePkr, this.imagePath});

  @override
  Widget build(BuildContext context) {
    Map<String, String> workerInformation = {
      "Age": "22",
      "Experience": "2 years",
      "Education": "Metric Pass",
      "HomeTown": "Islamabad",
      "Expertise": "Electric Wiring"
    };
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
              height: widgetHeight(300),
              width: double.infinity,
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
              )),
              //color: const Color(0x6047a3d4),
              child: Column(
                children: [
                  SizedBox(
                    height: widgetHeight(20),
                  ),
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage(
                      imagePath.toString(),
                    ),
                  ),
                  SizedBox(
                    height: widgetHeight(20),
                  ),
                  Text(
                    name.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: widgetHeight(10),
                  ),
                  Text(
                    service.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: widgetHeight(20),
            ),
            SizedBox(
              height: widgetHeight(300),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: workerInformation.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = workerInformation.keys.elementAt(index);
                    String value = workerInformation.values.elementAt(index);
                    return CustomWorkerListTile(
                      leadingText: key,
                      trailingText: value,
                    );
                  }),
            ),
            SizedBox(
              height: widgetHeight(30),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BillPage(
                      imagePath: imagePath,
                      name: name,
                      pricePkr: pricePkr,
                      service: service,
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
                      "Order Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
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
      ),
    );
  }
}

class CustomWorkerListTile extends StatelessWidget {
  const CustomWorkerListTile({
    super.key,
    required this.leadingText,
    required this.trailingText,
  });
  final String leadingText;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widgetHeight(7),
      ),
      child: ListTile(
        tileColor: const Color(0x6047a3d4),
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
      ),
    );
  }
}
