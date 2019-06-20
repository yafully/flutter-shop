import 'package:flutter/material.dart';

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
                Text('bottom')
              ],
            )
          ],
        ),
      )
    );
  }

}



