// import 'package:flutter/material.dart';

// class IndexPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title:Text('My Shop')),
//       body:Center(
//        child: Text('aaaas')
//       )
//     );
//   }
// }

//stful命令快速创建动态组建
import 'package:flutter/material.dart';
import '../components/Global/global_searchbar.dart';//轮播组件
import '../components/Global/global_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'page_home.dart';
import 'page_catagory.dart';
import 'page_cart.dart';
import 'page_account.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title:Text('Home1')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      title:Text('Catagory')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title:Text('Cart')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title:Text('Account')
    )
  ];

  final List<Widget> tabPages = [
    HomePage(),
    CatagoryPage(),
    CartPage(),
    AccountPage()
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabPages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState((){
            currentIndex = index;
            currentPage = tabPages[currentIndex];
          });
        },
      ),
      appBar: MyCustomAppBar(
        height: 60,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabPages
      ),
      drawer: MyDrawer()
      
    );
  }

}



