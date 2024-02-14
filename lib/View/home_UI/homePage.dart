import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/home_UI/services_UI/electricianService.dart';
import 'package:jobvortex/View/home_UI/services_UI/hvacTechnician.dart';
import 'package:jobvortex/View/home_UI/services_UI/maidService.dart';
import 'package:jobvortex/View/home_UI/services_UI/plumberService.dart';
import 'package:jobvortex/View/home_UI/shared_Ui_components/homePageDivider.dart';
import 'package:jobvortex/View/home_UI/shared_Ui_components/offersCard.dart';
import 'package:jobvortex/View/home_UI/shared_Ui_components/servicesCard.dart';
import 'package:jobvortex/View/home_UI/shared_Ui_components/homePageText.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    List navigationList = const [
      MaidService(),
      ElectricianService(),
      HvacTechnicianService(),
      PlumberService(),
    ];
    return SafeArea(
      bottom: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: homePageBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: widgetHeight(100),
                width: widgetWidth(365),
                margin: EdgeInsets.only(top: widgetHeight(10)),
                color: introContainerColor,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: widgetWidth(15),
                      left: widgetWidth(15),
                      top: widgetHeight(10),
                      bottom: widgetHeight(10)),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Hello, Usama!"
                          " What service do you"
                          " need today",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: widgetWidth(30),
                      ),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/clientPic.jpg'),
                      ),
                    ],
                  ),
                ),
              ),
              const HomePageDivider(),
              const HomePageText(text: "Services"),
              SizedBox(
                height: widgetHeight(250),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (BuildContext context, int index) {
                    return ServicesCard(
                      num: index,
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => navigationList[index]),
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: widgetWidth(12),
                    );
                  },
                ),
              ),
              const HomePageDivider(),
              const HomePageText(
                text: "Coming Soon! 😀 ",
              ),
              SizedBox(
                height: widgetHeight(240),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (BuildContext context, int index) {
                    return OffersCard(
                      num: index,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: widgetWidth(12),
                    );
                  },
                ),
              ),
              SizedBox(
                height: widgetHeight(120),
              )
            ],
          ),
        ),
      ),
    );
  }
}
