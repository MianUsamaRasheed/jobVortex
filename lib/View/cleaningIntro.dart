import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/constant.dart';
import 'package:jobvortex/Model/utils/dimension.dart';

class CleaningIntro extends StatelessWidget {
  const CleaningIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cleaning_intro_color,
        body: Column(
          children: [
            SizedBox(
              child: Image.asset('images/cleaningIntro.jpg'),
            ),
            SizedBox(
              height: widgetHeight(16),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                      colors: gradientColors,
                      begin: Alignment.topLeft,
                      end:  Alignment.topRight,
                  ) ,
                ),
                padding: const EdgeInsets.only(top: 40,left: 20,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text(
                          "Welcome to our platform, where cleanliness meets convenience! Discover a range of top-notch cleaning services tailored to your needs. ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),

                      ),
                    ),


                    Container(
                      width: widgetWidth(200),
                      height: widgetHeight(50),
                      color: Colors.white,
                    ),

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
