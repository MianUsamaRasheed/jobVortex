import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/CustomTile.dart';
import 'package:jobvortex/View/home_UI/services_UI/sharedUI/worker_details.dart';

class BookMarks extends StatefulWidget {
  const BookMarks({super.key});

  @override
  State<BookMarks> createState() => _BookMarksState();
}

class _BookMarksState extends State<BookMarks> {

  final _firestore = FirebaseFirestore.instance;
  List<String> electricServices = [];
  List<String> electricServicesWorkers = [];
  List<String> electricServicesPrices = [];
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
        _firestore.collection('Electrician').snapshots().listen((snapshot) {
          // Update data and UI whenever a change occurs in the collection
          if (snapshot.docChanges.isNotEmpty) {
            for (final change in snapshot.docChanges) {
              if (change.type == DocumentChangeType.added ||
                  change.type == DocumentChangeType.modified) {
                final data = change.doc.data();
                electricServices.add(data?['JobTitle']);
                electricServicesWorkers.add(data?['Name']);
                electricServicesPrices.add(data?['Price']);
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
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFE8F5FF),
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
              imageUrl: workerImages[index],
              service: electricServices[index],
              name: electricServicesWorkers[index],
              // reviewRating: electricServicesReviews[index],
              pricePkr: electricServicesPrices[index],
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WorkerDetails(
                      imageUrl: workerImages[index],
                      name: electricServicesWorkers[index],
                      pricePkr: electricServicesPrices[index],
                      service: electricServices[index],
                      workerUid: workerUid[index],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
