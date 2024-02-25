import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobvortex/Controller/worker_navigation_controller.dart';
import 'package:jobvortex/Model/custom_widgets/alert_dialog_custom.dart';
import 'package:jobvortex/Model/custom_widgets/customs.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/LogIn_UI/sharedUI_Components/customTextField.dart';
import 'package:provider/provider.dart';
import 'package:jobvortex/Controller/worker_data_controller.dart';

class AddTheJob extends StatefulWidget {
  const AddTheJob({super.key});

  @override
  State<AddTheJob> createState() => _AddTheJobState();
}

class _AddTheJobState extends State<AddTheJob> {
  String? dropTheValue;
  final servicePrice = TextEditingController();
  final typeService = TextEditingController();
  
  final List<String> services = [
    "Electrician",
    "Plumbing",
    "AC Repairing",
    "Maid"
  ];


  void _submitJob() {
    // Access Provider.of in response to form submission
    Provider.of<UserModel>(context, listen: false).setJobTitle(typeService.text);
    Provider.of<UserModel>(context,listen: false).setJobPrice(servicePrice.text);

    // You can perform other actions here, like submitting the form to a database
  }


  @override
  Widget build(BuildContext context) {
     String serviceType;

    initMediaQuerySize(context);
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5FF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueAppThemeColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const PoppinsTextStyle(
            text: "Add Job", textSize: 21, color: Colors.white, isBold: false),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: widgetHeight(50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: widgetHeight(50),
                  width: widgetWidth(150),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Center(
                    child: DropdownButton<String>(
                      value: dropTheValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      hint: const PoppinsTextStyle(
                          text: "Choose Service",
                          textSize: 17,
                          color: Colors.black,
                          isBold: false),
                      underline: Container(
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropTheValue = newValue!;
                        });
                      },
                      items: services
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: PoppinsTextStyle(
                                text: value,
                                textSize: 17,
                                color: Colors.black,
                                isBold: false));
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  height: widgetHeight(50),
                  width: widgetWidth(190),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: blueAppThemeColor,
                  ),
                  child: Center(
                    child: PoppinsTextStyle(
                        text: dropTheValue != null
                            ? "Service: $dropTheValue"
                            : " ",
                        textSize: 17,
                        color: Colors.white,
                        isBold: false),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: widgetHeight(50),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: widgetWidth(15), right: widgetWidth(15)),
              child: Column(
                children: [
                  CustomTextField(
                      text: "Type of Your Service",
                      textFieldIcon: const Icon(Icons.handyman),
                      controller: typeService),
                  SizedBox(
                    height: widgetHeight(30),
                  ),
                  CustomTextField(
                      text: "Price of your Service",
                      textFieldIcon: const Icon(Icons.payment),
                      controller: servicePrice),
                ],
              ),
            ),
            SizedBox(
              height: widgetHeight(370),
            ),
            GestureDetector(
              onTap: () => showConfirmationDialog(context),
              child: Container(
                height: widgetHeight(70),
                width: widgetWidth(double.infinity),
                color: blueAppThemeColor,
                child: const Center(
                  child: PoppinsTextStyle(
                      text: "Post your Job",
                      textSize: 20,
                      color: Colors.white,
                      isBold: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: MediaQuery.of(context).size.width *
                0.9, // Set width to 90% of screen width
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Set min size to contain the content
              children: [
                const ProtestTextStyle(
                    text: "Confirm your Job",
                    textSize: 30,
                    color: Colors.black),
                SizedBox(
                  height: widgetHeight(30),
                ),
                AlertRow(
                    text: dropTheValue.toString(), leadingText: "Service: "),
                SizedBox(
                  height: widgetHeight(10),
                ),
                AlertRow(text: typeService.text, leadingText: "Service type: "),
                SizedBox(
                  height: widgetHeight(10),
                ),
                AlertRow(text: servicePrice.text, leadingText: "Price: "),
                SizedBox(
                  height: widgetHeight(30),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 7.0),
                    child: PoppinsTextStyle(
                        text: "Are you sure that this information is correct ",
                        textSize: 15,
                        color: Colors.black,
                        isBold: false)),
                SizedBox(
                  height: widgetHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final provider_var = Provider.of<UserModel>(context,listen: false);
                        FirebaseFirestore.instance.collection(dropTheValue.toString()).doc(
                          provider_var.uid
                        ).set({
                          "Name": provider_var.workerName,
                          "JobTitle": typeService.text,
                          "Price": servicePrice.text,
                          "Uid": provider_var.uid,
                          "imageUrl" : provider_var.imageUrl,
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const WorkerNavigationController()));
                      },
                      child: const Text(
                        "Yes, I am sure",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "No",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: widgetHeight(20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
