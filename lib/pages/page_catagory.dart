import 'package:flutter/material.dart';

//import '../service/service_method.dart';
//import '../model/goodlist.dart';

//import '../components/Catagory/catagory_left.dart';//左侧导航
//import '../components/Catagory/catagory_right.dart';//右侧导航

import '../components/Catagory/catagory_list.dart';
import '../components/Catagory/catagory_list_sliver.dart';
//import 'package:flutter_easyrefresh/easy_refresh.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
//import '../model/catagory.dart';
//stless 静态组建快速构建命令
//stful 动态组件命令

class CatagoryPage extends StatefulWidget {
  @override
  _CatagoryPageState createState() => _CatagoryPageState();
}

class _CatagoryPageState extends State<CatagoryPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:Container(
      //   child:CatagoryGoodList()
      // )
      body:MyScrollView()
    );
  }

}

