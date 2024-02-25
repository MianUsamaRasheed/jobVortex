import 'dart:io';

import 'package:flutter/material.dart';

class ClientModel extends ChangeNotifier {


  String? uid;
  String? workerUid;
  String? clientName;
  late File imagePath ;
  String? clientEmail;
  String? clientNumber;

  String? imageUrl;


  setClientNumber(String number ) {
    clientNumber = number;
    notifyListeners(); // Notify listeners when the user email changes
  }
  setWorkerUid(String uid ) {
    workerUid = uid;
    notifyListeners(); // Notify listeners when the user email changes
  }

  setClientEmail(String email ) {
    clientEmail = email;
    notifyListeners(); // Notify listeners when the user email changes
  }

  setClientName(String name ) {
    clientName = name;
    notifyListeners(); // Notify listeners when the user email changes
  }

  void setUserID(String id ) {
    uid = id;
    notifyListeners(); // Notify listeners when the user email changes
  }

  setImagePath(File image){
    imagePath = image;
    notifyListeners();
  }

  setImageUrl(String url) {
    imageUrl = url;
    notifyListeners();
  }


}