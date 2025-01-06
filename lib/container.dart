import 'package:flutter/material.dart';
import 'package:todoapp/controller/constants/app-colors/app-colors.dart';
class ContainerClass extends StatelessWidget {
  const ContainerClass({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
                height: 80, width: 140,
                decoration: BoxDecoration(color:appColors.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight:Radius.circular(200),))
            ),
            Container(
              height: 140,
              width: 80,
              decoration: BoxDecoration( color:appColors.primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(200),
                    bottomRight: Radius.circular(200)),
              ),),
            // Padding(
            //     padding: const EdgeInsets.only(left: 20,top:20 ),
            //     child: IconButton(onPressed: (){
            //       Navigator.of(context).popUntil(ModalRoute.withName('IntroView'));
            //     }, icon: Icon(Icons.arrow_back_rounded))
            // )
          ],),
      ],
    );
  }
}