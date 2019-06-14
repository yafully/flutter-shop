import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommend extends StatelessWidget {
  final List recommendList;
  Recommend({Key key,this.recommendList}) : super(key: key);
  //标题
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(5.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
        color:Colors.white,
        border: Border(
          bottom: BorderSide(width:0.5,color:Colors.black12)
        )
      ),
      child: Text(
        'Recommend',
        style: TextStyle(color: Colors.black)
      ),
    );
  }

  //商品单元
  Widget _item(index){
    return InkWell(
      onTap: () {

      },
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5,color:Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('\$${recommendList[index]['finalprice']}'),
            Text('\$${recommendList[index]['price']}',
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough
              ),
            )
          ],
        ),
      ),
    );
  }

  //列表
  Widget _recommendList(){
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index){
          return _item(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList(),

        ],
      ),
    );
  }
}
