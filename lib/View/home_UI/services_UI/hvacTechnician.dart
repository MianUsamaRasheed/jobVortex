import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/home_UI/services_UI/Services/list_hvac_services.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/CustomTile.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/worker_details.dart';

class HvacTechnicianService extends StatelessWidget {
  const HvacTechnicianService({super.key});

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
          "A/C Service",
          style: TextStyle(
            color: electricianServiceAppBarTextColor,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: hvacServices.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CustomTile(
            imagePath: hvacImages[index],
            service: hvacServices[index],
            name: hvacServicesWorkers[index],
            reviewRating: hvacServicesReviews[index],
            pricePkr: hvacServicesPrices[index],
            onClick: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkerDetails(
                imagePath: hvacImages[index],
                name: hvacServicesWorkers[index],
                pricePkr: hvacServicesPrices[index],
                service: hvacServices[index],
              )));
            },
          );
        },
      ),
    );
  }
}
