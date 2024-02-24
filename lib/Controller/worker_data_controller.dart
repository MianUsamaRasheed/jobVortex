import 'dart:io';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String? jobTitle;
  String? price;
  String? uid;
  String? workerName;
  late File imagePath ;
  bool isImageSelected = false;


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
  imageSelected(bool selection){
    isImageSelected = selection;
    notifyListeners();
  }


}