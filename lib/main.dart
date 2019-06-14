import 'package:flutter/material.dart';
import './pages/page_index.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'My Store1',
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          primaryColor: Colors.pink
        ),
        home:IndexPage()
      ),
    );
  }
}