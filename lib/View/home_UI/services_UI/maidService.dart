import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/home_UI/services_UI/Services/list_maid_services.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/CustomTile.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/worker_details.dart';

class MaidService extends StatelessWidget {
  const MaidService({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Maid Service",
          style: TextStyle(
            color: electricianServiceAppBarTextColor,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: maidServices.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CustomTile(
            imagePath: maidImages[index],
            service: maidServices[index],
            name: maidServicesWorkers[index],
            reviewRating: maidServicesReviews[index],
            pricePkr: maidServicesPrices[index],
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WorkerDetails(
                        imagePath: maidImages[index],
                        name: maidServicesWorkers[index],
                        pricePkr: maidServicesPrices[index],
                        service: maidServices[index],
                      )));
            },
          );
        },
      ),
    );
  }
}
