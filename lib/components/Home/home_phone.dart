import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePhone extends StatelessWidget {
  final String homePhoneImage;
  final String homePhoneNumber;
  HomePhone ({Key key, this.homePhoneImage, this.homePhoneNumber}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          _launchUrl();
        },
        child: Image.network(homePhoneImage,fit: BoxFit.fitWidth),
      )
    );
  }

  void _launchUrl() async{
    String url = 'tel:'+ homePhoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}