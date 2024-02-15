import 'package:flutter/material.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFE8F5FF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: widgetHeight(150),
                    width: double.infinity,
                    color: blueAppThemeColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 25,
                          )),
                      const Text(
                        "Your profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 25,
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: widgetHeight(90), left: widgetWidth(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'images/myimage.jpg',
                        height: widgetHeight(110),
                        width: widgetWidth(100),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: widgetHeight(20), left: widgetWidth(20)),
                  child: SizedBox(
                    height: widgetHeight(40),
                    width: double.infinity,
                    child: const Text(
                      "Abdullah Rashid",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(left: widgetWidth(20)),
                child: SizedBox(
                    height: widgetHeight(20),
                    width: double.infinity,
                    child: const CustomGreyText(
                      text: "@abdullahr01",
                    )),
              ),
              SizedBox(
                height: widgetHeight(20),
              ),
              CustomExpansionWidget(
                leadingIcon: const Icon(Icons.person),
                titleText: "Personal Information",
                childWidget: Container(
                  height: widgetHeight(130),
                  width: widgetWidth(double.infinity),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomGreyText(text: "Abdullah Rashid"),
                          SizedBox(
                            width: widgetWidth(140),
                          ),
                          Container(
                            height: widgetHeight(30),
                            width: widgetWidth(50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: blueAppThemeColor),
                                color: extraLightBlueAppTheme),
                            child: const Center(
                                child: Text(
                              "Edit",
                              style: TextStyle(color: lightBlueAppTheme, fontFamily: 'Poppins'),
                            )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: widgetHeight(10),
                      ),
                      const CustomGreyText(text: "abdullahRashid01@gmail.com"),
                      SizedBox(
                        height: widgetHeight(10),
                      ),
                      const CustomGreyText(text: "+81-03093023"),
                    ],
                  ),
                ),
              ),
              CustomExpansionWidget(
                  leadingIcon: const Icon(Icons.security_sharp),
                  titleText: "Login and Security",
                  childWidget: Padding(
                    padding: EdgeInsets.only(right: widgetWidth(50)),
                    child: SizedBox(
                      height: widgetHeight(80),
                      width: widgetWidth(270),
                      child: const Text(
                        "- Secured by Agent RSK-9k-i992",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 17, fontFamily: 'Poppins'),
                      ),
                    ),
                  )),
              CustomExpansionWidget(
                leadingIcon: const Icon(Icons.phone_in_talk),
                titleText: "Customer Support",
                childWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomGreyText(text: "JVertex@business.com"),
                    SizedBox(
                      height: widgetHeight(10),
                    ),
                    const CustomGreyText(text: "+47-02279206"),
                  ],
                ),
              ),
              CustomExpansionWidget(
                  leadingIcon: const Icon(Icons.security_sharp),
                  titleText: "About Us",
                  childWidget: Padding(
                    padding: EdgeInsets.only(right: widgetWidth(50)),
                    child: SizedBox(
                      height: widgetHeight(280),
                      width: widgetWidth(270),
                      child: const Text(
                        "Discover unparalleled convenience with our cutting-edge app, a premier portal to elite home services. We seamlessly connect you with top-tier plumbers, maids, and more, ensuring reliability and excellence at competitive prices. Elevate your home experience with us, where quality and convenience converge.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15, fontFamily: 'Poppins'),
                      ),
                    ),
                  )),
              CustomExpansionWidget(
                  leadingIcon: const Icon(Icons.power_settings_new_outlined),
                  titleText: "Log out",
                  childWidget: DummyGreyContainer(
                    heightD: widgetHeight(80),
                    widthD: widgetWidth(280),
                    colorVisible: false,
                    child: Row(
                    children: [
                      const CustomGreyText(text: "Log out ",),
                      SizedBox(
                        width: widgetWidth(90),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: widgetHeight(60),
                          width: widgetWidth(90),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red[100]),
                          child: const Center(
                            child: Icon(
                              Icons.logout_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
                  ),
              SizedBox(
                height: widgetHeight(20),
              ),
              Padding(
                padding: EdgeInsets.only(right: widgetWidth(250)),
                child: const Text(
                  "Member ID",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold, fontFamily: "Poppins"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: widgetWidth(239)),
                child: SizedBox(
                  height: widgetHeight(30),
                  width: widgetWidth(100),
                  child: const Text(
                    "192293839",
                    style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: "Poppins"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomExpansionWidget extends StatelessWidget {
  final Widget leadingIcon;
  final String titleText;
  final Widget childWidget;
  const CustomExpansionWidget(
      {super.key,
      required this.leadingIcon,
      required this.titleText,
      required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: blueAppThemeColor,
      backgroundColor: Colors.grey[200],
      leading: leadingIcon,
      title: Text(titleText),
      children: [
        Padding(
            padding: EdgeInsets.only(left: widgetWidth(55)), child: childWidget)
      ],
    );
  }
}
