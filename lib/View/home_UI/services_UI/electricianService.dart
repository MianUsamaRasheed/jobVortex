import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
// import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/CustomTile.dart';

class ElectricianService extends StatelessWidget {
  const ElectricianService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: electricianServicePageBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: electricianServiceAppBarIconColor,
        ),
        backgroundColor: electricianServiceAppBarBackGroundColor,
        title: const Text(
          "Electrician Service",
          style: TextStyle(
            color: electricianServiceAppBarTextColor,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CustomTile(
            onClick: (){

            },
          );
        },
      ),
    );
  }
}

