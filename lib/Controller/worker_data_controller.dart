import 'dart:io';

import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String? jobTitle;
  String? price;
  String? uid;
  String? workerName;
  late File imagePath ;
  String? workerEmail;
  String? workerNumber;

  String? imageUrl;


  setWorkerNumber(String number ) {
    workerNumber = number;
    notifyListeners(); // Notify listeners when the user email changes
  }
  setWorkerEmail(String email ) {
    workerEmail = email;
    notifyListeners(); // Notify listeners when the user email changes
  }
  setWorkerName(String name ) {
    workerName = name;
    notifyListeners(); // Notify listeners when the user email changes
  }
  setJobPrice(String newPrice ) {
    price = newPrice;
    notifyListeners(); // Notify listeners when the user email changes
  }
  void setUserID(String id ) {
    uid = id;
    notifyListeners(); // Notify listeners when the user email changes
  }
  void setJobTitle(String jobTitle ) {
    this.jobTitle = jobTitle;
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