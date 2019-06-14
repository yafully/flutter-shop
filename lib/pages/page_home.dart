import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../service/service_method.dart';
import '../components/swiper.dart';//轮播组件
import '../components/home_menu.dart';//首页分类导航
import '../components/home_ad.dart';//首页广告条
import '../components/home_phone.dart';//首页电话
import '../components/home_recommend.dart';//首页推荐
import '../components/home_floor.dart';//首页楼层
//import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('1111');
  }

  String homePageContent = '正在获取数据';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('HomeApp')),
      body: FutureBuilder(
        future: getHomePageContent(),
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
            return SingleChildScrollView(
              child: Column(
              children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList),
                  HomeMenu(homeMenuList: homeMenuList),
                  HomeAd(adPicture: adPicture),
                  HomePhone(homePhoneImage: homePhoneImage, homePhoneNumber: homePhoneNumber),
                  Recommend(recommendList: recommendList),
                  FloorTitle(floorImage: floorImage),
                  FloorContent(floorGoodsList: floorGoodsList)
                ],
              )
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

  // void initState(){
  //   getHomePageContent().then((val){
  //     print(val);
  //     setState((){
  //       homePageContent = val.toString();
  //     });
  //   });
  //   super.initState();
  // }

}
