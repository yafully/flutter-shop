import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/increase.dart';

//stless 静态组建快速构建命令
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          children: <Widget>[
            Number(),
            MyButton()
          ],
        )
      )
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<Counter>(builder: (context,child,counter){
        return Text('${counter.value}');
      },),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          Provide.value<Counter>(context).increament();
        },
        child: Text('Increase'),
      ),
    );
  }
}