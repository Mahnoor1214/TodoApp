import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/controller/constants/app-colors/app-colors.dart';
class ButtonWidget extends StatelessWidget {
  String text;
  VoidCallback ontap;
  ButtonWidget({super.key,
    required this.text, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap ,
        child: Container(
          height: 44, width: 220,
          color: appColors.primaryColor,
          child: Center(child: Text(text,style: GoogleFonts.poppins(
              color: appColors.secondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500
          ),),),
        )
    );
  }
}
