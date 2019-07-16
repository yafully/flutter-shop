import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../model/goodlist.dart';

class CatagoryListSliver extends StatefulWidget {
  @override
  _CatagoryListSliverState createState() => _CatagoryListSliverState();
}

class _CatagoryListSliverState extends State<CatagoryListSliver> {
  int page = 1;
  List<Map> goodsList = [];

  void initState() {
    _getGoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750, height: 1334)..init(context);//初始化屏幕适配
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index){
          return InkWell(
            onTap: (){},
            child:Container(
              width: ScreenUtil().setWidth(372),
              color: Colors.black26,
              //padding: EdgeInsets.all(5.0),
              //margin: EdgeInsets.only(bottom: 3.0),
              child: Column(
                children: <Widget>[
                  Image.network(goodsList[index]['image'],height:ScreenUtil().setHeight(260)),
                  Text(
                    goodsList[index]['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color:Colors.pink,fontSize: ScreenUtil().setSp(24)),
                    ),
                    Row(children: <Widget>[
                      Text('\$${goodsList[index]['finalprice']}'),
                      Text(
                        '\$${goodsList[index]['price']}',
                        style:TextStyle(color:Colors.grey,decoration: TextDecoration.lineThrough)
                      )
                    ],)
                ],
              ),
            )
          );
          // Image.network(
          //   goodsList[index]['image'],
          //   fit:BoxFit.cover,
          // );
        },
        childCount:goodsList.length
      ),
      
    );
  }

  void _getGoodList() async{
    var data = {
      'catagoryId':'4',
      'page':page
    };
    await getData('getGoods',formData:data).then((val){
      //print(val);
      GoodListModel goodList = GoodListModel.fromJson(val);
      //print(goodList.data[0].name);
      var data = val;
      List<Map> newGoodsList = (data['data'] as List).cast();
      setState((){
        goodsList.addAll(newGoodsList);//合并数组
        page++;
      });
    });

  }

}
