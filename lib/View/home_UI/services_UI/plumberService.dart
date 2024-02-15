import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/home_UI/services_UI/Services/list_plumber_services.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/CustomTile.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/worker_details.dart';

class PlumberService extends StatelessWidget {
  const PlumberService({super.key});

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
          "Plumber Service",
          style: TextStyle(
            color: electricianServiceAppBarTextColor,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: plumberServices.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CustomTile(
            imagePath: plumberImages[index],
            service: plumberServices[index],
            name: plumberServicesWorkers[index],
            reviewRating: plumberServicesReviews[index],
            pricePkr: plumberServicesPrices[index],
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WorkerDetails(
                        imagePath: plumberImages[index],
                        name: plumberServicesWorkers[index],
                        pricePkr: plumberServicesPrices[index],
                        service: plumberServices[index],
                      )));
            },
          );
        },
      ),
    );
  }
}
