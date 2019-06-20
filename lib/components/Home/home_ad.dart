import 'package:flutter/material.dart';

class HomeAd extends StatelessWidget {
  final String adPicture;
  HomeAd({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}