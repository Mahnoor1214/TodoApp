import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/container.dart';
import 'package:todoapp/controller/constants/app-colors/app-colors.dart';
import 'package:todoapp/controller/widget/blacktext-widget.dart';
import 'package:todoapp/views/home-view/newdata-view/update-view.dart';
import 'newdata-view/newdata-entry.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.backGroundColor,
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                children:[Column(
                  children: [
                    Container(
                      height: 220,
                      width:510,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(backgroundImage: AssetImage('assets/girl3.jpeg'),radius: 50,),
                          SizedBox(height: 20,),
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
                    Icon(Icons.add_circle,color: appColors.blackColor,)),
                     // IconButton(onPressed: (){Navigator.push(context,
                     //     MaterialPageRoute(builder: (context)=>UpdateDataEntry(docId: 'docid')));},
                     //     icon: Icon(Icons.update_sharp,color: appColors.blackColor,))
                  ],),Container(
                    height: 170,width: 310,decoration: BoxDecoration(borderRadius:
                  BorderRadius.circular(30),color: Colors.grey[50]),
                    child: Expanded(child: StreamBuilder(stream: FirebaseFirestore.instance.collection(
                        FirebaseAuth.instance.currentUser!.uid).snapshots(),
                        builder:(BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
                          final data = snapshot.data!.docs;
                          return ListView.builder (
                            itemCount:data.length,
                            itemBuilder:(context,index) {
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>UpdateDataEntry(docId: data[index]['docid'])));
                                  },
                                  onLongPress: () {
                                    FirebaseFirestore.instance
                                        .collection(FirebaseAuth.instance.currentUser!.uid) // Use the current user's collection
                                        .doc(data[index]['docid']) // Target the specific document ID
                                        .delete()
                                        .then((_) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Task deleted successfully")),
                                      );
                                    })
                                        .catchError((error) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Failed to delete task: $error")),
                                          );
                                      });
                                  },
                                  title: Text(data[index]['description']),
                                  subtitle: Text(data[index]['title']),
                                ),
                              );
                            },
                          );
                        }
                    )
                    ),)
                ],
              ),
            ),
              height: 226,width:326 ,decoration: BoxDecoration(color: appColors.secondaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:todoapp/container.dart';
// import 'package:todoapp/controller/constants/app_colors/app_colors.dart';
// import 'package:todoapp/controller/widgets/blacktext.dart';
// import 'package:todoapp/view/home-view/new_data_entry/new_data_entry.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class HomeView extends StatelessWidget {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: appColors.backGroundColor,
//         body: Column(
//             children: [
//               Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         height: 220,
//                         width: 510,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CircleAvatar(radius: 50),
//                             SizedBox(height: 20),
//                             BlackTextHeading(text: 'Welcome Back!'),
//                           ],
//                         ),
//                         decoration: BoxDecoration(
//                           color: appColors.primaryColor.withOpacity(0.6),
//                         ),
//                       ),
//                     ],
//                   ),
//                   ContainerClass(),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Image.asset('assets/5th.png', height: 246, width: 222),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           BlackTextHeading(text: 'Todo Tasks'),
//                           IconButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => NewDataEntry(),
//                                 ),
//                               );
//                             },
//                             icon: Icon(Icons.add_circle,
//                                 color: appColors.blackColor),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => NewDataEntry(),
//                                 ),
//                               );
//                             },
//                             icon: Icon(Icons.update_sharp,
//                                 color: appColors.blackColor),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         height: 170,
//                         width: 310,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.grey[50],
//                         ),
//                         child: StreamBuilder(
//                           stream: FirebaseFirestore.instance
//                               .collection('Todo list')
//                               .snapshots(),
//                           builder: (BuildContext context,
//                               AsyncSnapshot<QuerySnapshot> snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return Center(child: CircularProgressIndicator());
//                             }
//                             if (snapshot.hasError) {
//                               return Center(
//                                   child: Text('Error: ${snapshot.error}'));
//                             }
//                             if (!snapshot.hasData ||
//                                 snapshot.data!.docs.isEmpty) {
//                               return Center(child: Text('No tasks found'));
//                             }
//
//                             final data = snapshot.data!.docs;
//
//                             return ListView.builder(
//                               itemCount: data.length,
//                               itemBuilder: (context, index) {
//                                 final document = data[index];
//                                 final docId = document.id; // Document ID fallback
//                                 final description = document['description'] ?? 'No description';
//                                 final title = document['title'] ?? 'No title';
//
//                                 return Card(
//                                   child: ListTile(
//                                     onTap: () {},
//                                     onLongPress: () {
//                                       FirebaseFirestore.instance
//                                           .collection('Todo list')
//                                           .doc(docId)
//                                           .delete();
//                                     },
//                                     title: Text(description),
//                                     subtitle: Text(title),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 height: 226,
//                 width: 326,
//                 decoration: BoxDecoration(
//                   color: appColors.secondaryColor,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//             ],
//              ),
//             );
//       }
// }