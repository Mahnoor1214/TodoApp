import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todoapp/controller/constants/app-colors/app-colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(color: appColors.primaryColor,size: 40,);
  }
}
