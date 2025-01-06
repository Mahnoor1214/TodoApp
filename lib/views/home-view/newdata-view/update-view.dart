import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:todoapp/controller/widget/textformfield.dart';
class UpdateDataEntry extends StatefulWidget {
  final String docId; // Pass the document ID to this screen
  UpdateDataEntry({super.key, required this.docId});
  @override
  State<UpdateDataEntry> createState() => _UpdateDataEntryState();
}
class _UpdateDataEntryState extends State<UpdateDataEntry> {
  TextEditingController TitleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  bool isloading = false;
  @override
  updatedata() async {
    try {
      isloading = true;
      setState(() {});
      User? user = FirebaseAuth.instance.currentUser;
      String userId = user!.uid;

      await FirebaseFirestore.instance.collection(userId).doc(widget.docId).update({
        'title': TitleController.text,
        'description': DescriptionController.text,
      });

      isloading = false;
      setState(() {});
      Navigator.pop(context);
    } catch (e) {
      isloading = false;
      setState(() {});
      Get.snackbar('Error', '${e.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.backGroundColor,
      body:  Column(
        children: [
          ContainerClass(),
          SizedBox(height: 5),
          Image.asset('assets/4rth.png', height: 172, width: 243),
          SizedBox(height: 40),
          BlackTextHeading(text: 'Update Your Task'),
          SizedBox(height: 20),
          NormalTextWidget(
            text: 'Modify the details as per your choice',
            textColor: appColors.primaryColor,
          ),
          SizedBox(height: 20),
          TextFormFieldWidget(
            hintText: 'Enter Name of your Task',
            controller: TitleController,
          ),
          SizedBox(height: 10),
          TextFormFieldWidget(
            hintText: 'Add Description',
            controller: DescriptionController,
          ),
          SizedBox(height: 20),
          isloading
              ? AppLoader()
              : ButtonWidget(
            text: 'Update Task',
            ontap: () {
              updatedata();
            },
          ),
        ],
      ),
    );
  }
}







































































// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:todoapp/controller/constants/app-colors/app-colors.dart';
// import 'package:todoapp/controller/constants/app-loader/app-loader.dart';
// import 'package:todoapp/controller/widget/blacktext-widget.dart';
// import 'package:todoapp/controller/widget/button-widget.dart';
// import 'package:todoapp/controller/widget/normaltext-widget.dart';
// import 'package:todoapp/controller/widget/textformfield.dart';
//
// class UpdateDataScreen extends StatefulWidget {
//   String docid;
//   UpdateDataScreen({super.key, required this.docid});
//
//   @override
//   State<UpdateDataScreen> createState() => _UpdateDataScreenState();
// }
//
// class _UpdateDataScreenState extends State<UpdateDataScreen> {
//   TextEditingController taskController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   bool isLoading=false;
//   updateData() async{
//     try{
//       await FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.uid).doc(widget.docid).update({
//         'enterTask':taskController.text,
//         'taskDescription':descriptionController.text,
//       });
//       Navigator.pop(context);
//     }
//     catch (e) {}
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 30),
//                 BlackTextHeading(text: 'Update Data'),
//                 const SizedBox(height: 20),
//                 NormalTextWidget(
//                   text: 'Fill in the details below',
//                   textColor: appColors.primaryColor,
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormFieldWidget(
//                   hintText: 'Enter Task',
//                   controller: taskController,
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormFieldWidget(
//                   hintText: 'Enter Task Description',
//                   controller: descriptionController,
//                 ),
//                 const SizedBox(height: 30),
//                 isLoading==true?AppLoader():ButtonWidget(
//                   text: 'Save Data',
//                   ontap: () {
//                     updateData();
//                     //insertData();// This is just the UI screen; backend logic can be implemented here.
//                   },
//                 ),
//               ],
//             ),
//             ),
//         );
//   }
// }
