import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                color:  Color(0xFFE8F5FF),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15,left: 15,top: 23,bottom: 23),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text("Hello, Usama!"
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
            ),
            SizedBox(
              height: widgetHeight(20),
            ),

          ],
        ),
      ),
    );
  }
}