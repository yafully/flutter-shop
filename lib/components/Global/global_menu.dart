import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../service/service_method.dart';
import '../../model/catagory.dart';
import './custom_expansion.dart' as custom;

class MainMenus extends StatefulWidget {
  @override
  _MainMenusState createState() => _MainMenusState();
}

class _MainMenusState extends State<MainMenus> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List list = [];

  void initState() {
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(1100),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return _item(list[index]);
        },
      )      
    );
  }

  Widget _item(data){
    return custom.ExpansionTile(
      key: PageStorageKey('a1'),
      //title: Text(data.catagoryName),
      title: InkWell(
        onTap: (){print('title');},
        child: Container(
          child: Text(data.catagoryName),
          //color: Colors.black12,
        ),
      ),
      headerBackgroundColor: Colors.black12,
      iconColor: Colors.white,
      children: _getChildren(data.childCatagory)
      //data.childCatagory.map(_item).toList(),
    );
  }

  List<Widget> _getChildren(childData) {
    List<Widget> children = [];
    if(childData.length>1){
      childData.forEach((child) {
        children.add(
          new ListTile(
            dense: true,
            title: new Text(child['catagoryName']),
            leading: new Icon(Icons.more_vert,color:Colors.black12),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => YourNewPage(),
              //       ),
              // );
              print('click');
            }
          )
        );
      });
    }
    return children;
  }

  void _getCategory() async{
    print(list);
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