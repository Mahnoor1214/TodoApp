import 'package:flutter/material.dart';
import 'package:todoapp/Controller/widgets/buttonwidget.dart';
import 'package:todoapp/Controller/widgets/normaltext.dart';
import 'package:todoapp/container.dart';
import 'package:todoapp/controller/constants/app_colors/app_colors.dart';
import 'package:todoapp/controller/widgets/blacktext.dart';
import 'package:todoapp/controller/widgets/textformfield.dart';
import 'package:todoapp/view/auth_view/signin_view/signin_view.dart';
import 'package:todoapp/view/home-view/home_view.dart';
class SignupView extends StatelessWidget {
  SignupView({super.key});
  TextEditingController fullNameController= TextEditingController();
  TextEditingController EmailController= TextEditingController();
  TextEditingController PasswordController= TextEditingController();
  TextEditingController ConfirmPassController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: appColors.backGroundColor,
      body: Column(children: [ContainerClass(),
        BlackTextHeading(text: 'Welcome Onboard!'),
        SizedBox(height: 35,),
        NormalTextWidget(text: 'Let’s help you meet up your task', textColor: appColors.primaryColor,),
        SizedBox(height: 35,),
        TextFormFieldWidget(hintText:    'Enter your Full Name', controller:fullNameController),
        SizedBox(height: 8,),
        TextFormFieldWidget(hintText:   'Enter your Email address ', controller:EmailController),
        SizedBox(height: 8,),
        TextFormFieldWidget(hintText: 'Create a Password', controller:PasswordController),
        SizedBox(height: 8,),
        TextFormFieldWidget(hintText: 'Confirm your Password', controller:ConfirmPassController),
        SizedBox(height: 8,),
        SizedBox(height: 80,),
        ButtonWidget(text: 'Sign Up', ontap: (){Navigator.push(context,
            MaterialPageRoute(builder: (context)=>HomeView()));
        }),
        SizedBox(height: 10,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NormalTextWidget(text: 'Already have an account?', textColor:appColors.primaryColor),
              SizedBox(width: 5,),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninView()));
                  },
                  child: NormalTextWidget(text: 'Sign in',textColor:appColors.blackColor ,))
            ]
        ),
      ],),);
  }
}