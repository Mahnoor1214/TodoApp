import 'package:flutter/material.dart';
import 'package:todoapp/Controller/widgets/buttonwidget.dart';
import 'package:todoapp/Controller/widgets/normaltext.dart';
import 'package:todoapp/container.dart';
import 'package:todoapp/controller/constants/app_colors/app_colors.dart';
import 'package:todoapp/controller/widgets/textformfield.dart';
class NewDataEntry extends StatelessWidget {
  NewDataEntry({super.key});
  TextEditingController listController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: appColors.backGroundColor,
      body: Column(children: [ContainerClass(),SizedBox(height: 8,),
        Image.asset('assets/4rth.png',height: 172,width: 243,),
        SizedBox(height: 35,),
        NormalTextWidget(text: 'Add What You Want To Do Later On', textColor: appColors.primaryColor,),
        SizedBox(height: 10,),
        TextFormFieldWidget(hintText: 'ToDo Task', controller:listController ),
        TextFormFieldWidget(hintText: 'ToDo Task', controller:listController ),
        TextFormFieldWidget(hintText: 'ToDo Task', controller:listController ),
        TextFormFieldWidget(hintText: 'ToDo Task', controller:listController ),
        SizedBox(height: 20,),
        ButtonWidget(text: 'Add To List', ontap: (){
        }),
      ],

      ),
    );
  }
}
