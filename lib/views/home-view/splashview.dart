
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/container.dart';
import 'package:todoapp/controller/constants/app-colors/app-colors.dart';
import 'package:todoapp/controller/constants/app-loader/app-loader.dart';
import 'package:todoapp/controller/widget/blacktext-widget.dart';
import 'package:todoapp/controller/widget/button-widget.dart';
import 'package:todoapp/controller/widget/normaltext-widget.dart';
import 'package:todoapp/views/auth-view/signup-view/signup-view.dart';
import 'package:todoapp/views/home-view/home-view.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});
  @override
  State<IntroView> createState() => _IntroViewState();
}
class _IntroViewState extends State<IntroView> {
  void initState() {
    super.initState();Future.delayed(Duration(seconds: 3),(){Navigator.push(context,
        MaterialPageRoute(builder: (context)=>SignupView()));
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: appColors.backGroundColor,
      body: Column(children: [ContainerClass(),
        Image.asset('assets/1st.png',height: 254,width: 354,),
        SizedBox(height: 30,),
        BlackTextHeading(text: 'Get Things Done With Todo App'),
        SizedBox(height: 15,),
        NormalTextWidget(text: "Welcome to Todo App! Organize tasks, \n"
            "set priorities,and stay on track effortlessly.\n "
            "Let’s get started!",
          textColor: appColors.primaryColor,),
        SizedBox(height: 20,),
        AppLoader(),
        SizedBox(height: 10,),
        ButtonWidget(text: 'Get Started', ontap: () async {
          User? check= await FirebaseAuth.instance.currentUser;
        if(check==null){Navigator.push(context,
            MaterialPageRoute(builder: (context)=>SignupView()));
        }
        else{
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>HomeView()));}
        }),        ],
      ),
    );
  }
}