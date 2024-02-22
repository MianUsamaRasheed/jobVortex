import 'package:flutter/material.dart';
import 'package:jobvortex/Controller/navigationController.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/home_UI/homePage.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: electricianServicePageBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: electricianServiceAppBarIconColor,
          ),
          backgroundColor: electricianServiceAppBarBackGroundColor,
          title: const Text(
            "User Details & Payment Method",
            style: TextStyle(
              color: electricianServiceAppBarTextColor,
              fontFamily: 'Poppins',
              fontSize: 19
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: widgetHeight(20),
                    ),
                    const Text(
                      "User Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'
                      ),
                    ),
                    SizedBox(
                      height: widgetHeight(15),
                    ),
                    SizedBox(
                      height: widgetHeight(50),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          labelText: "Current Address",
                          hintStyle: TextStyle(
                            color: textFieldBorderColor,
                            fontFamily: 'Poppins'
                          ),
                          prefixIcon: Icon(
                              Icons.pin_drop
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: widgetHeight(20),
                    ),
                    SizedBox(
                      height: widgetHeight(50),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          labelText: "Phone Number",
                          hintStyle: TextStyle(
                            color: textFieldBorderColor,
                            fontFamily: 'Poppins'
                          ),
                          prefixIcon: Icon(
                              Icons.phone
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: widgetHeight(50),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: widgetHeight(30),
                    ),
                    const Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'
                      ),
                    ),
                    SizedBox(
                      height: widgetHeight(15),
                    ),
                    const RadioButtonTileGroup(),
                    SizedBox(
                      height: widgetHeight(140),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Poppins'
                          ),
                        ),
                        Text("400 PKR",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins'
                        ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
              Container(
                color: Colors.blue.shade900,
                width: widgetWidth(double.infinity),
                height: widgetHeight(49),
                child: Row(
                  children: [
                    SizedBox(
                      width: widgetWidth(12),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage(),));
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Poppins'
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widgetWidth(180),
                    ),
                    GestureDetector(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => AlertDialog(
                        //   title: Container(
                        //     //color: Colors.white,
                        //     child: Image(
                        //       image: AssetImage("images/thankyou.jpg"),
                        //     ),
                        //   ),
                        //   content: Text(
                        //     "Thank You",
                        //   ),
                        // )));
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              surfaceTintColor: Colors.white,
                              contentPadding: EdgeInsets.zero,
                              content: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9, // Set width to 90% of screen width
                                child: Column(
                                  mainAxisSize: MainAxisSize.min, // Set min size to contain the content
                                  children: [
                                    SizedBox(
                                      width : widgetWidth(200),
                                      height: widgetHeight(200),
                                      child: const Image(
                                        image: AssetImage("images/thankyou.jpg"),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Thank You 💐",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Protest'
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0,right: 7.0),
                                      child: Text(
                                        "Your Order is Successfully done and your service provider is on her way!",
                                        style: TextStyle(fontFamily: 'Poppins'),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const NavigationController(),),); // Close the AlertDialog
                                      },
                                      child: const Text("OK", style: TextStyle(fontFamily: 'Poppins'),),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          const Text("Confirm Order",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: 'Poppins'
                            ),
                          ),
                          SizedBox(
                            width: widgetWidth(5),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class RadioButtonTileGroup extends StatefulWidget {
  const RadioButtonTileGroup({super.key});

  @override
  State<RadioButtonTileGroup> createState() => _RadioButtonTileGroupState();
}

class _RadioButtonTileGroupState extends State<RadioButtonTileGroup> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: widgetWidth(5),),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey, // Set the color of the border
              width: 1.0, // Set the width of the border
            ),
            borderRadius: BorderRadius.circular(10.0), // Set the border radius
          ),

          child: ListTile(
            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: widgetHeight(5)
            ),
            leading: const Image(
              image: AssetImage("icons/cash.png"),
            ),
            title: const Text("                 Cash", style: TextStyle(fontFamily: 'Poppins'),),
            trailing: Radio(
              activeColor:Colors.blue.shade900 ,
              value: 1,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as int;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: widgetHeight(10),
        ),
        Container(
          padding: EdgeInsets.only(left: widgetWidth(5),),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey, // Set the color of the border
              width: 1.0, // Set the width of the border
            ),
            borderRadius: BorderRadius.circular(10.0), // Set the border radius
          ),

          child: ListTile(
            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: widgetHeight(5)
            ),
            leading: SizedBox(
              width: widgetWidth(70),
              child: const Image(
                image: AssetImage("icons/jazzcash.png"),
              ),
            ),
            title: const Text("         Jazz cash", style: TextStyle(fontFamily: 'Poppins'),),
            trailing: Radio(
              activeColor:Colors.blue.shade900 ,
              value: 2,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as int;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
