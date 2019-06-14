import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

Future getHomePageContent() async{
  try {
    print('==========开始获取首页数据...==============');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    var formData = {'city':'wuhan'};
    response = await dio.post(servicePath['homePageContent'],queryParameters:formData);
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception('后端异常');
    }    
  } catch (e) {
    print(e);
  }
}

Future getHomeHotContent() async{
  try {
    print('==========获取首页热卖数据...==============');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    int page = 1;
    response = await dio.post(servicePath['homePageContent'],data:page);
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception('后端异常');
    }    
  } catch (e) {
    print(e);
  }
}