import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../model/goodlist.dart';

class MyScrollView extends StatefulWidget {
  @override
  _MyScrollViewState createState() => _MyScrollViewState();
}

class _MyScrollViewState extends State<MyScrollView> {
  GlobalKey<RefreshFooterState> _footerkey = new GlobalKey<RefreshFooterState>();
  int page = 1;
  List<Map> goodsList = [];

  void initState() {
    _getGoodList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
        loadingText:'Loading...',
        isFloat:true
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //title: Text('Catagory Sort'),
            pinned: true,
            //floating: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Catagory Sort'),
              background: Image.asset('images/drawer_bg.jpg',fit: BoxFit.cover,),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: CatagoryListSliver(goodsList:goodsList),
            ),
          )
          
        ],
      ),
      loadMore:() {
        //print('===Load More===');
        _getGoodList();
      }
    );
  }

  void _getGoodList() async{
    var data = {
      'catagoryId':'4',
      'page':page
    };
    await getData('getGoods',formData:data).then((val){
      //print(val);
      //GoodListModel goodList = GoodListModel.fromJson(val);
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

class CatagoryListSliver extends StatefulWidget {
  final List goodsList;
  const CatagoryListSliver({Key key, this.goodsList}) : super(key: key);
  @override
  _CatagoryListSliverState createState() => _CatagoryListSliverState();
}

class _CatagoryListSliverState extends State<CatagoryListSliver> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750, height: 1334)..init(context);//初始化屏幕适配
    // return Container(
    //   child: _goods(),
    // );
    var itemWidth = ScreenUtil().setWidth(372);
    var itemHeight = ScreenUtil().setHeight(470);
    return  SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio:(itemWidth / itemHeight),
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index){
          return InkWell(
            onTap: (){},
            
              child: Container(
                //width: ScreenUtil().setWidth(372),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                //color: Colors.black26,
                //padding: EdgeInsets.all(5.0),
                //margin: EdgeInsets.only(bottom: 3.0),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: new BorderRadius.circular(8.0),
                        child: Image.network(widget.goodsList[index]['image'],fit: BoxFit.cover,),
                    ),
                    
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child:Column(
                        children: <Widget>[
                          Text(
                            widget.goodsList[index]['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color:Color.fromRGBO(69, 69, 69, 1.0),fontSize: ScreenUtil().setSp(30)),
                          ),
                          
                          Row(children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                '\$${widget.goodsList[index]['finalprice']}',
                                style: TextStyle(color:Color.fromRGBO(217, 90, 11, 1.0),fontSize: ScreenUtil().setSp(30)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                '\$${widget.goodsList[index]['price']}',
                                style:TextStyle(color:Colors.grey,decoration: TextDecoration.lineThrough,fontSize: ScreenUtil().setSp(22))
                              )
                            )
                          ],)
                        ],
                      )
                    )
                  ],
                ),
              ),

            
            
          );
        },
        childCount: widget.goodsList.length
      ),
      
    );
  }

  // Widget _goods(){
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         _wrapList(),
  //       ],
  //     )
  //   );
  // }

  // Widget _wrapList(){
  //   if(widget.goodsList.length>0){
  //     print("长度");
  //     print(widget.goodsList.length);
  //     //把数据数组转化成组件数组
  //     List<Widget> listWidget = widget.goodsList.map((val){
  //       return InkWell(
  //         onTap: (){},
  //         child:Container(
  //           width: ScreenUtil().setWidth(372),
  //           color: Colors.white,
  //           padding: EdgeInsets.all(5.0),
  //           margin: EdgeInsets.only(bottom: 3.0),
  //           child: Column(
  //             children: <Widget>[
  //               Image.network(val['image'],width:ScreenUtil().setWidth(370)),
  //               Text(
  //                 val['name'],
  //                 maxLines: 1,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: TextStyle(color:Colors.pink,fontSize: ScreenUtil().setSp(24)),
  //                 ),
  //                 Row(children: <Widget>[
  //                   Text('\$${val['finalprice']}'),
  //                   Text(
  //                     '\$${val['price']}',
  //                     style:TextStyle(color:Colors.grey,decoration: TextDecoration.lineThrough)
  //                   )
  //                 ],)
  //             ],
  //           ),
  //         )
  //       );
  //     }).toList();
  //     return Wrap(
  //       spacing: 2,
  //       children: listWidget,
  //     );

  //   }else{
  //     return Text('');
  //   }
  // }    

}
