import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/bill_Page.dart';

class WorkerDetails extends StatelessWidget {
  final String? service;
  final String? name;
  final String? pricePkr;
  final String? imageUrl;
  final String? workerUid;
  const WorkerDetails(
      {super.key,
      this.service,
      this.name,
      this.pricePkr,
      this.imageUrl,
      this.workerUid});

  @override
  Widget build(BuildContext context) {
    Map<String, String> workerInformation = {
      "Age": "22",
      "Experience": "2 years",
      "Education": "Metric Pass",
      "HomeTown": "Islamabad",
      "Expertise": service.toString(),
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
              color: electricianServiceAppBarTextColor, fontFamily: 'Poppins'),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      imageUrl!,
                      height: widgetHeight(110),
                      width: widgetWidth(110),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: widgetHeight(20),
                  ),
                  Text(
                    name.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: widgetHeight(10),
                  ),
                  Text(
                    service.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => BillPage(
                        imagePath: imageUrl,
                        name: name,
                        pricePkr: pricePkr,
                        service: service,
                        workerUID: workerUid),
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
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
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
              fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
        trailing: Text(
          trailingText,
          style: const TextStyle(fontSize: 15, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
