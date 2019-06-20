import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotGoods extends StatefulWidget {
  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  int page = 1;
  List<Map> hotGoodsList = [];

  void initState() {
    super.initState();
    _getHotGoods();
    print('777');
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750, height: 1334)..init(context);//初始化屏幕适配
    return Container(
      child:_hotGoods()
    );
  }

  void _getHotGoods() {
    var pageData = {'page':page};

    getData('homePageHotContent',formData:pageData).then((val){
      //hotGoodsList
      var data = val;
      List<Map> newGoodsList = (data['data']['data'] as List).cast();
      setState((){
        hotGoodsList.addAll(newGoodsList);//合并数组
        page++;
      });
    });
  }

  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding:EdgeInsets.all(5.0),
    alignment:Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      border:Border(
        bottom: BorderSide(width:0.5 ,color:Colors.black12)
      )
    ),
    child: Text('Hot Products'),
  );

  Widget _wrapList(){
    if(hotGoodsList.length>0){
      //把数据数组转化成组件数组
      List<Widget> listWidget = hotGoodsList.map((val){
        return InkWell(
          onTap: (){},
          child:Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(val['image'],width:ScreenUtil().setWidth(370)),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color:Colors.pink,fontSize: ScreenUtil().setSp(24)),
                  ),
                  Row(children: <Widget>[
                    Text('\$${val['finalprice']}'),
                    Text(
                      '\$${val['price']}',
                      style:TextStyle(color:Colors.grey,decoration: TextDecoration.lineThrough)
                    )
                  ],)
              ],
            ),
          )
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );

    }else{
      return Text('');
    }
  }

  Widget _hotGoods(){
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList(),
        ],
      )
    );
  }

}