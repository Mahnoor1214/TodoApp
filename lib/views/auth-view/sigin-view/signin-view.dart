
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
import 'package:todoapp/views/auth-view/signup-view/signup-view.dart';
import 'package:todoapp/views/home-view/home-view.dart';
class SigninView extends StatefulWidget {
  SigninView({super.key});
  @override
  State<SigninView> createState() => _SigninViewState();
}
class _SigninViewState extends State<SigninView> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController= TextEditingController();
  bool isLoading =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: appColors.backGroundColor,body:
    Center(child: Column(children: [Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
    ],
    ),
      ContainerClass(),
      BlackTextHeading(text: 'Welcome Back!'),
      SizedBox(height: 8,),
      Image.asset('assets/3rd.png',height: 226,width: 211,),
      SizedBox(height: 10,),
      TextFormFieldWidget(hintText:    'Enter your Email Address', controller:EmailController,),
      SizedBox(height: 5,),
      Passwordfield(hintText: 'Enter your password', controller: PasswordController),
      SizedBox(height: 20,),
      isLoading?AppLoader():ButtonWidget(text: 'Sign In', ontap: ()async{
        isLoading =true;setState(() {
        });
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: EmailController.text.trim(),
            password:PasswordController.text.trim()).then((onValue){
          Navigator.push(context, CupertinoPageRoute(builder: (context)=>HomeView()));
        }).onError((value,error){
          isLoading =false;setState(() {
          });Get.snackbar('Error','${value.toString()}',backgroundColor: appColors.primaryColor);
          print('Error'+value.toString());
        });
      }),
      SizedBox(height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NormalTextWidget(text: 'Don\'t have an Account ?', textColor:appColors.primaryColor),
            SizedBox(width: 5,),
            InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupView()));
                },
                child: NormalTextWidget(text: 'Sign Up',textColor:appColors.blackColor ,)),
          ]),
    ],
    )),
    );
  }
}
