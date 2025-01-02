import 'package:flutter/material.dart';
import 'package:todoapp/container.dart';
import 'package:todoapp/controller/constants/app_colors/app_colors.dart';
import 'package:todoapp/controller/widgets/blacktext.dart';
import 'package:todoapp/view/home-view/new_data_entry/new_data_entry.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.backGroundColor,
      body:  Column(
        children: [
          Stack(
              children:[Column(
                children: [
                  Container(
                    height: 220,
                    width:510,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(radius: 50,),SizedBox(height: 20,),
                        BlackTextHeading(text: 'Welcome Back!'),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: appColors.primaryColor.withOpacity(0.6),
                    ),
                  )],
              ),
                ContainerClass(),
              ]
          ),
          SizedBox(height: 8,),
          Image.asset('assets/5th.png',height: 246,width: 222,),
          Container(child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                  BlackTextHeading(text: 'Todo  Tasks'),IconButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>NewDataEntry()));
                  }, icon:
                  Icon(Icons.add_circle,color: appColors.blackColor,))
                ],),Container(
                  height: 170,width: 310,decoration: BoxDecoration(borderRadius:
                BorderRadius.circular(30),color: Colors.grey[50]),
                )
              ],
            ),
          ),
            height: 226,width:326 ,decoration: BoxDecoration(color: appColors.secondaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }
}
