import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorTitle extends StatelessWidget {
  final String floorImage;
  FloorTitle({Key key, this.floorImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Image.network(floorImage),
    );
  }
}

class FloorContent extends StatelessWidget {
  final List floorGoodsList;
  const FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750, height: 1334)..init(context);//初始化屏幕适配
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _secRow()
        ],
      ),
    );
  }

  Widget _firstRow(){
    return Row(children: <Widget>[
      _goodsItem(floorGoodsList[0]),
      Column(
        children: <Widget>[
          _goodsItem(floorGoodsList[1],height:187.0),
          _goodsItem(floorGoodsList[2],height:187.0)
        ],
      )
    ],);
  }

  Widget _secRow(){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4])
      ],
    );
  }

  Widget _goodsItem(Map goods, {height = 375.0}){
    
    return Container(
      width: ScreenUtil().setWidth(375),
      height:  ScreenUtil().setHeight(height),
      child: InkWell(
        onTap: (){
          print('click');
        },
        child: Image.network(goods['image']),
      ),
    );
  }
}