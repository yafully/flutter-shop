import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';//屏幕适配器

  class HomeMenu extends StatelessWidget {
    final List homeMenuList;

    HomeMenu({Key key, this.homeMenuList}) : super(key: key);

    Widget _gridViewItemUI(BuildContext context, item){
      return InkWell(
        onTap: () {
          print('Clicked');
        },
        child: Column(
          children: <Widget>[
            Image.network(item['image'], width: ScreenUtil().setWidth(95)),
            Text(item['name'])
          ],
        )
      );
    }

    @override
    Widget build(BuildContext context) {
      ScreenUtil.instance = ScreenUtil(width:750, height: 1334)..init(context);//初始化屏幕适配
      return Container(
        height: ScreenUtil().setHeight(320),
        padding: EdgeInsets.all(3.0),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),//禁止拖动
          crossAxisCount: 5,
          padding: EdgeInsets.all(5.0),
          children: homeMenuList.map((item){
            return _gridViewItemUI(context,item);
          }).toList(),
        ),
      );
    }
  }