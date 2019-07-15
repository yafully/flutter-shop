import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({Key key,@required this.height,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color.fromRGBO(231, 217, 208, 1.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 25.0, 0, 0),
            child: Container(
              color: Color.fromRGBO(231, 217, 208, 1.0),
              padding: EdgeInsets.all(5.0),
              child: Row(children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                Expanded(
                  child: Container(
                    child:new Image.asset('images/logo.png',width: 127,height: 38,),
                    // color: Colors.white,
                    // child: TextField(
                    //   decoration: InputDecoration(
                    //     hintText: "Search",
                    //     contentPadding: EdgeInsets.all(10.0),
                    //   ),
                    // ),
                  )
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => null,
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}