import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../service/service_method.dart';
import '../components/Home/swiper.dart';//轮播组件
import '../components/Home/home_menu.dart';//首页分类导航
import '../components/Home/home_ad.dart';//首页广告条
import '../components/Home/home_phone.dart';//首页电话
import '../components/Home/home_recommend.dart';//首页推荐
import '../components/Home/home_floor.dart';//首页楼层
//import '../components/home_hot.dart';//首页火爆专区
import '../components/Home/home_hot.dart' as hot;
//import 'dart:convert'; //Jsondecode需要用到

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  GlobalKey<RefreshFooterState> _footerkey = new GlobalKey<RefreshFooterState>();

  String homePageContent = '正在获取数据';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:Text('HomeApp'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       onPressed: (){
      //         print('111');
      //       },
      //     )
      //   ],
      // ),
      body: FutureBuilder(
        future: getData('homePageContent',formData:{'city':'wuhan'}),
        builder: (context, snapshot){
          if(snapshot.hasData){
            
            var data = snapshot.data;
            List<Map> swiperDataList = (data['data']['data']['bannerData'] as List).cast();
            List<Map> homeMenuList = (data['data']['data']['homeMenuData'] as List).cast();
            String adPicture = data['data']['data']['homeAd']['image'];
            String homePhoneImage = data['data']['data']['shopinfo']['phoneImage'];
            String homePhoneNumber = data['data']['data']['shopinfo']['phone'];

            List<Map> recommendList = (data['data']['data']['recommend'] as List).cast();

            String floorImage = data['data']['data']['homeFloor'][0]['image'];
            List<Map> floorGoodsList = (data['data']['data']['homeFloor'][0]['goods'] as List).cast();
            //print(recommendList);
            return EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: _footerkey,
                bgColor: Colors.white,
                textColor: Colors.pink,
                moreInfoColor: Colors.pink,
                showMore: true,
                noMoreText: '',
                moreInfo: 'Loading...',
                loadReadyText: 'pull load...',
              ),
              child: ListView(
              children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList),
                  HomeMenu(homeMenuList: homeMenuList),
                  HomeAd(adPicture: adPicture),
                  HomePhone(homePhoneImage: homePhoneImage, homePhoneNumber: homePhoneNumber),
                  Recommend(recommendList: recommendList),
                  FloorTitle(floorImage: floorImage),
                  FloorContent(floorGoodsList: floorGoodsList),
                  hot.HotGoods()
                ],
              ),
              loadMore:()async{
                print('===Load More===');
                //hot.HotGoods()._getHotGoods();
              }
            );

          }else{
            return Center(
              child: Text('Loading...'),
            );
          }
        },
      )
    );
  }

}
