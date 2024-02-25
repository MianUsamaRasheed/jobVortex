import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/Model/utils/dimension.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/CustomTile.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/worker_details.dart';

class MaidService extends StatefulWidget {
  const MaidService({super.key});

  @override
  State<MaidService> createState() => _MaidServiceState();
}

class _MaidServiceState extends State<MaidService> {


  final _firestore = FirebaseFirestore.instance;
  List<String> maidServices = [];
  List<String> maidServicesWorkers = [];
  List<String> maidServicesPrices = [];
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
        _firestore.collection('Maid').snapshots().listen((snapshot) {
          // Update data and UI whenever a change occurs in the collection
          if (snapshot.docChanges.isNotEmpty) {
            for (final change in snapshot.docChanges) {
              if (change.type == DocumentChangeType.added ||
                  change.type == DocumentChangeType.modified) {
                final data = change.doc.data();
                maidServices.add(data?['JobTitle']);
                maidServicesWorkers.add(data?['Name']);
                maidServicesPrices.add(data?['Price']);
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
          "Maid Service",
          style: TextStyle(
            color: electricianServiceAppBarTextColor,
            fontFamily: 'Poppins'
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: maidServices.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CustomTile(
            imageUrl: workerImages[index],
            service: maidServices[index],
            name: maidServicesWorkers[index],
            //reviewRating: maidServicesReviews[index],
            pricePkr: maidServicesPrices[index],
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WorkerDetails(
                        imageUrl: workerImages[index],
                        name: maidServicesWorkers[index],
                        pricePkr: maidServicesPrices[index],
                        service: maidServices[index],
                        workerUid: workerUid[index]
                      ),),);
            },
          );
        },
      ),
    );
  }
}
