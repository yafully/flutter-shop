import 'package:flutter/material.dart';

class CatagoryDetail extends StatefulWidget {
  final String productTitle;
  const CatagoryDetail({Key key, this.productTitle}) : super(key: key);
  @override
  _CatagoryDetailState createState() => _CatagoryDetailState();
}

class _CatagoryDetailState extends State<CatagoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productTitle),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: <Widget>[
          Text('data'),
          // Image.network(
            
          // )
        ],
      )
    );
  }
}