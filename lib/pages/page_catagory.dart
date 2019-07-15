import 'package:flutter/material.dart';

import '../service/service_method.dart';
import '../model/goodlist.dart';

//import '../components/Catagory/catagory_left.dart';//左侧导航
//import '../components/Catagory/catagory_right.dart';//右侧导航

//import '../components/Catagory/catagory_list.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import '../model/catagory.dart';
//stless 静态组建快速构建命令
//stful 动态组件命令

class CatagoryPage extends StatefulWidget {
  @override
  _CatagoryPageState createState() => _CatagoryPageState();
}

class _CatagoryPageState extends State<CatagoryPage> {
  
  @override
  Widget build(BuildContext context) {
    // return EasyRefresh(
    //   refreshFooter: ClassicsFooter(
    //     key: _footerkey,
    //     bgColor: Colors.white,
    //     textColor: Colors.pink,
    //     moreInfoColor: Colors.pink,
    //     showMore: true,
    //     noMoreText: '',
    //     moreInfo: 'Loading...',
    //     loadReadyText: 'pull load...',
    //   ),
    //   child: ListView(
    //     children: <Widget>[
    //       CatagoryGoodList()
    //     ],
    //   ),
    //   loadMore:()async{
    //     print('===Load More===');

    //   }
    // );
    return Scaffold(
      //appBar: AppBar(title: Text('Catagory')),
      body:Container(
        child:CatagoryGoodList()
        // Row(
        //   children: <Widget>[
        //     LeftCataNav(),
        //     Column(
        //       children: <Widget>[
        //         RightCatagory(),
                
        //       ],
        //     )
        //   ],
        // ),
      )
    );
  }

}

//产品列表
class CatagoryGoodList extends StatefulWidget {
  @override
  _CatagoryGoodListState createState() => _CatagoryGoodListState();
}

class _CatagoryGoodListState extends State<CatagoryGoodList> {
  GlobalKey<RefreshFooterState> _footerkey = new GlobalKey<RefreshFooterState>();
  
  int page = 1;
  List<Map> goodsList = [];

  void initState() {
    _getGoodList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750, height: 1334)..init(context);//初始化屏幕适配
    return EasyRefresh(
      autoLoad:true,
      refreshFooter: ClassicsFooter(
        key: _footerkey,
        bgColor: Colors.white,
        textColor: Colors.pink,
        moreInfoColor: Colors.pink,
        showMore: false,
        
        noMoreText: '',
        moreInfo: 'Loading...',
        loadReadyText: 'pull load...',
      ),
      child: Container(
        child: _goods(),
      ),
      loadMore:() {
        //print('===Load More===');
        _getGoodList();
      }
    );
    // return Container(
    //   child: _goods(),
    // );
  }

  Widget _wrapList(){
    if(goodsList.length>0){
      print("长度");
      print(goodsList.length);
      //把数据数组转化成组件数组
      List<Widget> listWidget = goodsList.map((val){
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
  Widget _goods(){
    return Container(
      child: Column(
        children: <Widget>[
          _wrapList(),
        ],
      )
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

