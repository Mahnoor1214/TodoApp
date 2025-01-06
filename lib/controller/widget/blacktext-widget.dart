import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/controller/constants/app-colors/app-colors.dart';
class BlackTextHeading extends StatelessWidget {
  String text;
  BlackTextHeading({super.key,required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
        color: appColors.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w500
    ),);
  }
}