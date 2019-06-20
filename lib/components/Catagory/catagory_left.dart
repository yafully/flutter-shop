import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../model/catagory.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provide/provide.dart';
import '../../provide/child_catagory.dart';
//import 'dart:convert';
//左侧一级导航
class LeftCataNav extends StatefulWidget {
  @override
  _LeftCataNavState createState() => _LeftCataNavState();
}

class _LeftCataNavState extends State<LeftCataNav> {

  List list = [];
  int listIndex = 0;

  void initState() {
    _getCategory();
    super.initState();
    print('999');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750, height: 1334)..init(context);//初始化屏幕适配

    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right:BorderSide(width:1,color:Colors.black12) 
        )
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return _leftInkWell(index);
        },
      ),
    );
  }

  Widget _leftInkWell(int index){
    bool isActive = false;
    isActive = index == listIndex ? true : false;
    return InkWell(
      onTap: (){
        var childList = list[index].childCatagory;
        Provide.value<ChildCatagory>(context).getChildCatagory(childList);
        setState(() {
         listIndex = index; 
        });
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left:10,top:20),
        decoration: BoxDecoration(
          color: isActive ? Colors.black12 : Colors.white,
          border: Border(
            bottom: BorderSide(width:1,color: Colors.black12)
          )
        ),
        child: Text(list[index].catagoryName,style:TextStyle(fontSize: ScreenUtil().setSp(30)),),
      ),
    );
  }

  void _getCategory() async{
    await getData('getCatagory').then((val){
      //print(val['data']['data']);
      CatagoryListModel catagory = CatagoryListModel.fromJson(val['data']);
      //print(catagory.data);
      // print('====Get====');
      // print(catagory);
      setState(() {
       list = catagory.data;
      });

      //初始化值
      Provide.value<ChildCatagory>(context).getChildCatagory(list[1].childCatagory);

      //catagory.data.forEach((item)=>print(item.catagoryName));
    });
  }
}