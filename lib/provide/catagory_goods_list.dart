import 'package:flutter/material.dart';
import '../model/goodlist.dart';

class CatagoryGoodsListProvide with ChangeNotifier{
  List<GoodListData> goodsList = [];
  
  getGoodsList(List<GoodListData> list){
    goodsList = list;
    notifyListeners();
  }
}