import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import './custom_expansion.dart' as custom;

// class MainMenus extends StatelessWidget {
//   final List list;
//   const MainMenus({Key key,this.list}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: ScreenUtil().setHeight(1100),
//       child: ListView.builder(
//         itemCount: list.length,
//         itemBuilder: (context, index){
//           return _item(list[index]);
//         },
//       ) 
//     );
//   }

//   Widget _item(data){
//     return custom.ExpansionTile(
//       key: PageStorageKey('a1'),
//       //title: Text(data.catagoryName),
//       title: InkWell(
//         onTap: (){print('title');},
//         child: Container(
//           child: Text(data.catagoryName),
//           //color: Colors.black12,
//         ),
//       ),
//       headerBackgroundColor: Colors.black12,
//       iconColor: Colors.white,
//       children: _getChildren(data.childCatagory)
//       //data.childCatagory.map(_item).toList(),
//     );
//   }

//   List<Widget> _getChildren(childData) {
//     List<Widget> children = [];
//     if(childData.length>1){
//       childData.forEach((child) {
//         children.add(
//           new ListTile(
//             dense: true,
//             title: new Text(child['catagoryName']),
//             leading: new Icon(Icons.more_vert,color:Colors.black12),
//             onTap: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //       builder: (context) => YourNewPage(),
//               //       ),
//               // );
//               print('click');
//             }
//           )
//         );
//       });
//     }
//     return children;
//   }

// }

class MainMenus extends StatefulWidget {
  final List list;
  MainMenus({Key key,this.list}):super(key:key);
  @override
  _MainMenusState createState() => _MainMenusState();
}

class _MainMenusState extends State<MainMenus> with AutomaticKeepAliveClientMixin<MainMenus> {
  @override
  bool get wantKeepAlive => true;
  void initState() {
    print('===Menuin===');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(1100),
      child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index){
          return _item(widget.list[index]);
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
              Navigator.pop(context);
            }
          )
        );
      });
    }
    return children;
  }

}