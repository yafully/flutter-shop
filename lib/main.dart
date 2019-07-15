import 'package:flutter/material.dart';
import './pages/page_index.dart';
import 'package:provide/provide.dart';
import './provide/increase.dart';
import './provide/child_catagory.dart';
import './provide/catagory_goods_list.dart';

void main(){
  var counter = Counter();
  var childCatagory = ChildCatagory();
  var catagoryGoodsListProvide = CatagoryGoodsListProvide();
  var providers = Providers();
  providers
  ..provide(Provider<Counter>.value(counter))
  ..provide(Provider<CatagoryGoodsListProvide>.value(catagoryGoodsListProvide))
  ..provide(Provider<ChildCatagory>.value(childCatagory));
  //多状态管理是
  // providers
  // ..provide(Provider<Counter1>.value(counter1))
  // ..provide(Provider<Counter2>.value(counter2));
  runApp(ProviderNode(child:MyApp(),providers:providers));
}

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