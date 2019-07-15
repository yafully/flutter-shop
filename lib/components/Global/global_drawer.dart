import 'package:flutter/material.dart';
import './global_menu.dart';

import '../../service/service_method.dart';
import '../../model/catagory.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List list = [];
  
  @override
  void initState() {
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height:145.0,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Ashish Rawat"),
                  accountEmail: Text("ashishrawat2911@gmail.com"),
    
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image:DecorationImage(
                        image: AssetImage('images/drawer_bg.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.5),
                          //Colors.yellow[400].withOpacity(0.6), 
                          BlendMode.hardLight)
                      )
                  ),
                  onDetailsPressed:(){
                    print('user click');
                  }
                ),
            ),
            MainMenus(list:list),//动态组件传参
          ],
        )
      );
  }

  void _getCategory() async{

    await getData('getCatagory').then((val){
      //print(val['data']['data']);
      CatagoryListModel catagory = CatagoryListModel.fromJson(val['data']);

      setState(() {
       list = catagory.data;
      });
      
      //catagory.data.forEach((item)=>print(item.catagoryName));
    });
  }  
}