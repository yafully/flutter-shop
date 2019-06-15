import 'package:flutter/material.dart';
import '../service/service_method.dart';

//stless 静态组建快速构建命令
//stful 动态组件命令

class CatagoryPage extends StatefulWidget {
  @override
  _CatagoryPageState createState() => _CatagoryPageState();
}

class _CatagoryPageState extends State<CatagoryPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Catagory'),
      ),
    );
  }

  void _getCategory() async{
    await getData('getCatagory').then((val){
      print(val);
    });
  }

  void initState() {
    super.initState();
    _getCategory();
    print('999');
  }
}