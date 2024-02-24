import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobvortex/Controller/worker_data_controller.dart';
import 'package:jobvortex/Model/custom_widgets/custom_expansion_tile.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:provider/provider.dart';

class WorkerProfilePage extends StatefulWidget {
  const WorkerProfilePage({super.key});

  @override
  State<WorkerProfilePage> createState() => _WorkerProfilePageState();
}

class _WorkerProfilePageState extends State<WorkerProfilePage> {
  bool isImageSelected = false;
  File? imageFile;

  _pickImagefromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
          isImageSelected = true;
          Provider.of<UserModel>(context,listen: false).imageSelected(isImageSelected);
        });
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  _pickImagefromCamera() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
          isImageSelected = true;
          Provider.of<UserModel>(context,listen: false).imageSelected(isImageSelected);

        });
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
                            Icons.arrow_back,
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
                    child: Provider.of<UserModel>(context).isImageSelected
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              Provider.of<UserModel>(context,listen: true).imagePath,
                              height: widgetHeight(110),
                              width: widgetWidth(100),
                              fit: BoxFit.cover,
                            ),
                          )
                        : IconButton(
                            icon: const Icon(
                                Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 35,

                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shadowColor: Colors.white,
                                    surfaceTintColor: Colors.white,
                                    title: Center(child: Text("Select Image")),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading:
                                              Icon(Icons.camera_alt_outlined),
                                          title: Text("Take Photo"),
                                          onTap: () {
                                            _pickImagefromCamera();
                                            Provider.of<UserModel>(context,listen: false).setImagePath(imageFile!);

                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.photo),
                                          title: Text("Choose from Gallery"),
                                          onTap: () {
                                            _pickImagefromGallery();
                                            Provider.of<UserModel>(context,listen: false).setImagePath(imageFile!);

                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: widgetHeight(20), left: widgetWidth(20)),
                  child: SizedBox(
                    height: widgetHeight(25),
                    width: double.infinity,
                    child: const Text(
                      "Muhammad Usama",
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
                      text: "@mianUSama",
                    )),
              ),
              SizedBox(
                height: widgetHeight(20),
              ),
              CustomExpansionWidget(
                leadingIcon: const Icon(Icons.person),
                titleText: "Personal Information",
                childWidget: SizedBox(
                  height: widgetHeight(130),
                  width: widgetWidth(double.infinity),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomGreyText(text: "Muhammad Usama"),
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
                              style: TextStyle(
                                  color: lightBlueAppTheme,
                                  fontFamily: 'Poppins'),
                            )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: widgetHeight(10),
                      ),
                      const CustomGreyText(text: "MianUsama@gmail.com"),
                      SizedBox(
                        height: widgetHeight(10),
                      ),
                      const CustomGreyText(text: "+49-08309023"),
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
                            fontSize: 17,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  )),
              CustomExpansionWidget(
                leadingIcon: const Icon(Icons.phone_in_talk),
                titleText: "Customer Support",
                childWidget: Padding(
                  padding: EdgeInsets.only(right: widgetWidth(170)),
                  child: Column(
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
                            fontSize: 15,
                            fontFamily: 'Poppins'),
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
                          const CustomGreyText(
                            text: "Log out ",
                          ),
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
                      ))),
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
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: widgetWidth(239)),
                child: SizedBox(
                  height: widgetHeight(30),
                  width: widgetWidth(100),
                  child: const Text(
                    "192293839",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontFamily: "Poppins"),
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
