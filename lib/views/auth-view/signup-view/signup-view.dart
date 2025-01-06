
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/container.dart';
import 'package:todoapp/controller/constants/app-colors/app-colors.dart';
import 'package:todoapp/controller/constants/app-loader/app-loader.dart';
import 'package:todoapp/controller/widget/blacktext-widget.dart';
import 'package:todoapp/controller/widget/button-widget.dart';
import 'package:todoapp/controller/widget/normaltext-widget.dart';
import 'package:todoapp/controller/widget/pass-field-widget.dart';
import 'package:todoapp/controller/widget/textformfield.dart';
import 'package:todoapp/views/auth-view/sigin-view/signin-view.dart';
import 'package:todoapp/views/home-view/home-view.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});
  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController fullNameController= TextEditingController();
  TextEditingController EmailController= TextEditingController();

  TextEditingController PasswordController= TextEditingController();

  // TextEditingController ConfirmPassController= TextEditingController();
  bool isLoading = false;

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
        Passwordfield(hintText: 'Enter your password', controller: PasswordController),
        SizedBox(height: 8,),
        //TextFormFieldWidget(hintText: 'Confirm your Password', controller:ConfirmPassController),
        SizedBox(height: 8,),
        SizedBox(height: 80,),
        isLoading?AppLoader():ButtonWidget(text: 'Sign Up', ontap: ()async { isLoading =true;
        setState((){});
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: EmailController.text.trim(),
            password: PasswordController.text.trim()).then((value){isLoading =false;setState(() {
        });Navigator.push(context, CupertinoPageRoute(builder: (context)=>HomeView()));
        }).onError((value,error){
          isLoading =false;setState(() {
          });Get.snackbar('Error','${value.toString()}',backgroundColor: appColors.primaryColor);
          // print('Error'+'${value.toString()}');
        });
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