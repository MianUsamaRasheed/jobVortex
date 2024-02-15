import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/View/home_UI/services_UI/Services/list_electric_services.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/CustomTile.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/worker_details.dart';

class BookMarks extends StatelessWidget {
  const BookMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Color(0xFFE8F5FF),
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: electricianServiceAppBarIconColor,
          ),
          backgroundColor: electricianServiceAppBarBackGroundColor,
          title: const Text(
            "BookMarks",
            style: TextStyle(
              color: electricianServiceAppBarTextColor,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: electricServices.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CustomTile(
              imagePath: workerImages[index],
              service: electricServices[index],
              name: electricServicesWorkers[index],
              reviewRating: electricServicesReviews[index],
              pricePkr: electricServicesPrices[index],
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WorkerDetails(
                          imagePath: workerImages[index],
                          name: electricServicesWorkers[index],
                          pricePkr: electricServicesPrices[index],
                          service: electricServices[index],
                        )));
              },
            );
          },
        ),
      ),
    );
  }
}
