import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/increase.dart';

//stless 静态组建快速构建命令
class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Provide<Counter>(builder: (context,child,counter){
          return Text('${counter.value}');
        }),
      )
    );
  }
}