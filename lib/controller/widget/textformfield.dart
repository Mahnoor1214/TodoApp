import 'package:flutter/material.dart';
import 'package:todoapp/controller/constants/app-colors/app-colors.dart';
class TextFormFieldWidget extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  TextFormFieldWidget({super.key,required this.hintText, required this.controller});
  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}
class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 28.0,vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: appColors.secondaryColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText,contentPadding:EdgeInsets.only(left:8),
              hintStyle: TextStyle(color: appColors.blackColor),
              border: InputBorder.none,
            )
        ),
      ),
    );
  }
}
