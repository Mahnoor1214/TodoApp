import 'package:flutter/material.dart';
class ImageClass extends StatelessWidget {
  static String splashImg='assets/splashimg.jpg';
  String loginImg= 'assets/loginimg.jpg';
// String appLogoImg= 'assets/loginimg.png';
  ImageClass({super.key, required this.loginImg});
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(splashImg),width: 400,);
  }
}