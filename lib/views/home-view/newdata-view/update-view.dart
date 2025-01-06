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
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }
  // fetchData() async {
  //   try {
  //     isloading = true;
  //     setState(() {});
  //     User? user = FirebaseAuth.instance.currentUser;
  //     String userId = user!.uid;
  //
  //     DocumentSnapshot doc = await FirebaseFirestore.instance
  //         .collection(userId)
  //         .doc(widget.docId)
  //         .get();
  //
  //     if (doc.exists) {
  //       TitleController.text = doc['title'];
  //       DescriptionController.text = doc['description'];
  //     }
  //     isloading = false;
  //     setState(() {});
  //   } catch (e) {
  //     isloading = false;
  //     setState(() {});
  //     Get.snackbar('Error', '${e.toString()}');
  //   }
  // }
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
        body: isloading
            ? Center(child: AppLoader())
            : Column(
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
