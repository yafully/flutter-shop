import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/httpHeader.dart';
//stless 静态组建快速构建命令
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     getHttp();
//     return Scaffold(
//       body:Center(child: Text('Home'),)
//     );
//   }

//   void getHttp () async{
//     try{
//       Response response;
//       response = await Dio().get('https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=大胸美女');
//       return print(response);
//     }catch(e){
//       return print(e);
//     }
//   }
// }

//stful命令快速创建动态组建
// class HomePage extends StatefulWidget {
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController typeController = TextEditingController();
//   String showText = 'Welcome this room';
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(title:Text('Open Room')),
//         body:SingleChildScrollView(//解决输入法弹出后超出边界警告
//           child:Container(
//             child: Column(
//               children: <Widget>[
//                 TextField(
//                   controller: typeController,
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.all(5.0),
//                     labelText: 'Girl Type',
//                     helperText: 'Enter your type'
//                   ),
//                   autofocus: false,
//                 ),
//                 RaisedButton(
//                   onPressed: (){_chooseAction();},
//                   child: Text('Choose'),
//                 ),
//                 Text(showText)
//               ],
//             )
//           )
//         )
//       ) 
//     );

//   }

//   void _chooseAction () {
//     print('start choose...');
//     if(typeController.text.toString()==''){
//       showDialog(
//         context: context,
//         builder: (context)=>AlertDialog(title:Text('Can not empty!'))
//       );
//     }else{
//       getHttp(typeController.text.toString()).then((val){
//         setState(() {
//          showText = val['data']['name'].toString(); 
//         });
//       });
//     }
//   }
//   Future getHttp(String TypeText) async{
//     try{
//         Response response;
//         var data = {'name':TypeText};
//         response = await Dio().post('https://www.easy-mock.com/mock/5c6d2a318d040716434d09e4/data/dabaojian_post',
//           queryParameters: data
//         );
//         return response.data;
//       }catch(e){
//         return print(e);
//       }
//     }    

// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String showText = '还没有数据';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('请求远程数据')),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            RaisedButton(
              onPressed: (){
                _startGet();
              },
              child: Text('请求数据')
            ),
            Text(showText)
          ])
        )
      ),
    );
  }

  void _startGet(){
    print('Start get data');
    getHttp().then((val){
      setState((){
        showText = val['data'].toString();
      });
    });

  }

  Future getHttp() async{
    try {
      Response response;
      Dio dio = new Dio();
      dio.options.headers = httpHeaders;//获取伪造请求头
      response = await dio.get('https://time.geekbang.org/serv/v1/column/newAll');
      print(response);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}