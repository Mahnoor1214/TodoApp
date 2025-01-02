
import 'package:flutter/material.dart';
import 'package:todoapp/Controller/widgets/buttonwidget.dart';
import 'package:todoapp/Controller/widgets/normaltext.dart';
import 'package:todoapp/container.dart';
import 'package:todoapp/controller/constants/app_colors/app_colors.dart';
import 'package:todoapp/controller/widgets/blacktext.dart';
import 'package:todoapp/controller/widgets/textformfield.dart';
import 'package:todoapp/view/auth_view/sinup_view/signup_view.dart';
import 'package:todoapp/view/home-view/home_view.dart';

class SigninView extends StatelessWidget {
  TextEditingController EmailAddressController = TextEditingController();
  TextEditingController ConfirmPassController= TextEditingController();
  SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: appColors.backGroundColor,body:
    Center(child: Column(children: [
      ContainerClass(),
      BlackTextHeading(text: 'Welcome Back!'),
      SizedBox(height: 8,),
      Image.asset('assets/3rd.png',height: 226,width: 211,),
      SizedBox(height: 10,),
      TextFormFieldWidget(hintText:    'Enter your Email Address', controller:EmailAddressController),
      SizedBox(height: 5,),
      TextFormFieldWidget(hintText:   'Confirm Password ', controller:ConfirmPassController),
      SizedBox(height: 20,),
      ButtonWidget(text: 'Sign In', ontap: (){Navigator.push(context,
          MaterialPageRoute(builder: (context)=>HomeView()));
      }),SizedBox(height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NormalTextWidget(text: 'Don\'t have an Account ?', textColor:appColors.primaryColor),
            SizedBox(width: 5,),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupView()));
                },
                child: NormalTextWidget(text: 'Sign Up',textColor:appColors.blackColor ,)),
          ]),
    ],
    )),
    );
  }
}
