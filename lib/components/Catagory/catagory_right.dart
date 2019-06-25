import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/child_catagory.dart';

//右侧菜单
class RightCatagory extends StatefulWidget {
  @override
  _RightCatagoryState createState() => _RightCatagoryState();
}

class _RightCatagoryState extends State<RightCatagory> {
  //List list = ['Cat1','Cat2','Cat3','Caaaat4','Cataa5','Caaaat6','Caaaat7'];
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCatagory>(builder: (context,child,childCatagory){
      //print(childCatagory.childCatagoryList);
      // childCatagory.forEach((v) {
      //   print(v);
      // });
      return Container(
        height: ScreenUtil().setHeight(80),
        width: ScreenUtil().setWidth(570),
        decoration: BoxDecoration(
          color:Colors.white,
          border:Border(bottom: BorderSide(width: 1,color: Colors.black12))
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: childCatagory.childCatagoryList.length,
          itemBuilder: (context,index){
            //print(childCatagory.childCatagoryList[index]);
            return _rightInkWell(childCatagory.childCatagoryList[index]);//_rightInkWell(list[index]);
          },
        ),
      );
    });


  }

  Widget _rightInkWell(data){
    //Map valueMap = json.decode(data);
    //print(data.runtimeType);
    //var d = new Map<String, dynamic>.from(data);
    //print(data.keys);
    //var data=json.decode(data.toString());

    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          data['catagoryName'],
          style: TextStyle(fontSize: ScreenUtil().setSp(30))
        ),
      ),
    );
  }
}