import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/CustomTile.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/worker_details.dart';

class PlumberService extends StatefulWidget {
  const PlumberService({super.key});

  @override
  State<PlumberService> createState() => _PlumberServiceState();
}

class _PlumberServiceState extends State<PlumberService> {


  final _firestore = FirebaseFirestore.instance;
  List<String> plumberServices = [];
  List<String> plumberServicesWorkers = [];
  List<String> plumberServicesPrices = [];
  List<String> workerImages = [];
  List<String> workerUid = [];

  // Add a StreamSubscription to listen for changes in the collection
  StreamSubscription<QuerySnapshot>? _subscription;

  @override
  void initState() {
    super.initState();
    _listenForChanges();
  }

  void _listenForChanges() {
    _subscription =
        _firestore.collection('Plumbing').snapshots().listen((snapshot) {
          // Update data and UI whenever a change occurs in the collection
          if (snapshot.docChanges.isNotEmpty) {
            for (final change in snapshot.docChanges) {
              if (change.type == DocumentChangeType.added ||
                  change.type == DocumentChangeType.modified) {
                final data = change.doc.data();
                plumberServices.add(data?['JobTitle']);
                plumberServicesWorkers.add(data?['Name']);
                plumberServicesPrices.add(data?['Price']);
                workerUid.add(data?['Uid']);
                workerImages
                    .add(data?['imageUrl']); // Handle potential missing image URL
              } else if (change.type == DocumentChangeType.removed) {
                // Handle removed documents (if applicable)
                // Update UI and data accordingly
              }
            }
            setState(() {});
          }
        });
  }




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
            imageUrl:  workerImages[index],
            service: plumberServices[index],
            name: plumberServicesWorkers[index],
            //reviewRating: plumberServicesReviews[index],
            pricePkr: plumberServicesPrices[index],
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WorkerDetails(
                        imageUrl: workerImages[index],
                        name: plumberServicesWorkers[index],
                        pricePkr: plumberServicesPrices[index],
                        service: plumberServices[index],
                        workerUid: workerUid[index]
                      )));
            },
          );
        },
      ),
    );
  }
}
