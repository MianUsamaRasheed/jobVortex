import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobvortex/Controller/worker_data_controller.dart';
import 'package:jobvortex/Model/custom_widgets/custom_expansion_tile.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/LogIn_UI/Worker_LogIn/worker_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';


class WorkerProfilePage extends StatefulWidget {
  const WorkerProfilePage({super.key});

  @override
  State<WorkerProfilePage> createState() => _WorkerProfilePageState();
}

class _WorkerProfilePageState extends State<WorkerProfilePage> {

  File? imageFile;

  Future<void> updateFirebaseDocument(String imageUrl) async {
    try {
      await FirebaseFirestore.instance
          .collection("Worker_User")
          .doc(Provider.of<UserModel>(context,listen: false).uid)
          .update({'imageUrl': imageUrl})
          .then((value) => print("Document updated successfully"));
    } catch (error) {
      print("Error updating document: $error");
    }
  }

  Future<String> uploadImageToFirebase(File imageFile) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('profile_images/${imageFile.path}');
      UploadTask uploadTask = ref.putFile(imageFile);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      // Handle Firebase errors
      return ""; // Return an empty string if the upload fails
    }
  }

  _pickImagefromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
        String imageUrl = await uploadImageToFirebase(imageFile!);
        final provider = Provider.of<UserModel>(context, listen: false);

        setState(() {
          provider.setImageUrl(imageUrl);
          updateFirebaseDocument(imageUrl);
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
          String imageUrl = await uploadImageToFirebase(imageFile!);
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
        String imageUrl = await uploadImageToFirebase(imageFile!);
        setState(() {
          Provider.of<UserModel>(context, listen: false).setImageUrl(imageUrl);
          updateFirebaseDocument(imageUrl);
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
    final provider = Provider.of<UserModel>(context);

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
                    child: GestureDetector(
                    onTap: () {
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
                                    Provider.of<UserModel>(
                                        context, listen: false).setImagePath(
                                        imageFile!);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo),
                                  title: Text("Choose from Gallery"),
                                  onTap: () {
                                    _pickImagefromGallery();
                                    Provider.of<UserModel>(
                                        context, listen: false).setImagePath(
                                        imageFile!);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                      child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:  Image.network(
                                Provider.of<UserModel>(context).imageUrl!,
                                height: widgetHeight(110),
                                width: widgetWidth(100),
                                fit: BoxFit.cover,
                              ),
                            ),

                  )
              ),
        ],
      ),
              Padding(
                  padding: EdgeInsets.only(
                      top: widgetHeight(20), left: widgetWidth(20)),
                  child: SizedBox(
                    height: widgetHeight(25),
                    width: double.infinity,
                    child: Text(
                     provider.workerName.toString() ,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  )),
              // Padding(
              //   padding: EdgeInsets.only(left: widgetWidth(20)),
              //   child: SizedBox(
              //       height: widgetHeight(20),
              //       width: double.infinity,
              //       child: const CustomGreyText(
              //         text: "@mianUSama",
              //       )),
              // ),
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
                          CustomGreyText(text: provider.workerName.toString()),
                          SizedBox(
                            width: widgetWidth(140),
                          ),
                          // Container(
                          //   height: widgetHeight(30),
                          //   width: widgetWidth(50),
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(20),
                          //       border: Border.all(color: blueAppThemeColor),
                          //       color: extraLightBlueAppTheme),
                          //   child: const Center(
                          //       child: Text(
                          //     "Edit",
                          //     style: TextStyle(
                          //         color: lightBlueAppTheme,
                          //         fontFamily: 'Poppins'),
                          //   )),
                          // )
                        ],
                      ),
                      SizedBox(
                        height: widgetHeight(10),
                      ),
                      CustomGreyText(text: provider.workerEmail.toString()),
                      SizedBox(
                        height: widgetHeight(10),
                      ),
                      CustomGreyText(text:provider.workerNumber.toString()),
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
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WorkerSignIn()));
                            },
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
                padding: EdgeInsets.only(right: widgetWidth(90)),
                child: SizedBox(
                  height: widgetHeight(30),
                  width: widgetWidth(250),
                  child: Text(
                    provider.uid.toString(),
                    style: const TextStyle(
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
