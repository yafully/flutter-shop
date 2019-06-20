import 'package:flutter/material.dart';
//import '../model/catagory.dart';

class ChildCatagory with ChangeNotifier{
  List<dynamic> childCatagoryList = [];
  
  getChildCatagory(List list){
    childCatagoryList = list;
    notifyListeners();
  }
}