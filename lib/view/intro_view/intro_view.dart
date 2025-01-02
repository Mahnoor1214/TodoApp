import 'package:flutter/material.dart';
import 'package:todoapp/Controller/widgets/buttonwidget.dart';
import 'package:todoapp/Controller/widgets/normaltext.dart';
import 'package:todoapp/container.dart';
import 'package:todoapp/controller/constants/app_colors/app_colors.dart';
import 'package:todoapp/controller/widgets/blacktext.dart';
import 'package:todoapp/view/auth_view/sinup_view/signup_view.dart';
class IntroView extends StatelessWidget {
        IntroView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: appColors.backGroundColor,
      body: Column(children: [ContainerClass(),
        Image.asset('assets/1st.png',height: 254,width: 354,),
        SizedBox(height: 30,),
        BlackTextHeading(text: 'Get Things Done With Todo App'),
        SizedBox(height: 30,),
        NormalTextWidget(text: "Lorem ipsum dolor sit amet consectetur\n "
            "adipisicing Maxime tempore! Animi nemo aut\n "
            "atque deleniti nihil dolorem repellendus",
          textColor: appColors.primaryColor,),
        SizedBox(height: 40,),
        CircularProgressIndicator(),
        ButtonWidget(text: 'Get Started', ontap: (){ Navigator.push(context,
            MaterialPageRoute(builder: (context)=>SignupView()));
        }),        ],
      ),
    );
  }
}