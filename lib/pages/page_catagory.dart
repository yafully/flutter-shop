import 'package:flutter/material.dart';

import '../service/service_method.dart';
import '../model/goodlist.dart';

import '../components/Catagory/catagory_left.dart';//左侧导航
import '../components/Catagory/catagory_right.dart';//右侧导航
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
      appBar: AppBar(title: Text('Catagory')),
      body:Container(
        child: Row(
          children: <Widget>[
            LeftCataNav(),
            Column(
              children: <Widget>[
                RightCatagory(),
                CatagoryGoodList()
              ],
            )
          ],
        ),
      )
    );
  }

}

//产品列表
class CatagoryGoodList extends StatefulWidget {
  @override
  _CatagoryGoodListState createState() => _CatagoryGoodListState();
}

class _CatagoryGoodListState extends State<CatagoryGoodList> {
  void initState() {
    _getGoodList();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Product List'),
    );
  }

  void _getGoodList() async{
    var data = {
      'catagoryId':'4',
      'page':1
    };

    await getData('getGoods',formData:data).then((val){
      //print(val);
      GoodListModel goodList = GoodListModel.fromJson(val);
      print(goodList.data[0].name);
    });

  }

}

