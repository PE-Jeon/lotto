//Getting Sub Collections List from FireStore
//https://medium.com/@borsezf2/sub-collections-list-from-firestore-d6c6e029bed3

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class test1 extends StatefulWidget {
  @override
  _test1State createState() => _test1State();
}

class _test1State extends State<test1> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }

  static List<CourseModel> FinalCoursesList = [] ;

  MastersList() async
  {
    List list_of_masters = await Firestore.instance.collection("masters")
        .getDocuments()
        .then((val) => val.documents);
    for (int i=0; i<list_of_masters.length; i++)
    {
      Firestore.instance.collection("masters").document(
          list_of_masters[i].documentID.toString()).collection("courses").snapshots().listen(CreateListofCourses);
    }
  }

  CreateListofCourses(QuerySnapshot snapshot) async
  {
    var docs = snapshot.documents;
    for (var Doc in docs)
    {
      FinalCoursesList.add(CourseModel.fromFireStore(Doc));
    }
  }
}

class CourseModel {
  String course_name;
  String price;
  String details;
  String pic_url;
  String master_name;
  String master_email;
  String course_uid;

  CourseModel({this.details,this.course_name,this.pic_url,this.price,this.master_name,this.master_email,this.course_uid});

  factory CourseModel.fromFireStore(DocumentSnapshot doc)
  {
    Map data = doc.data ;
    return CourseModel(
        course_name: data['course_name'],
        master_name: data['master_name'],
        master_email: data['master_email'],
        course_uid: doc.documentID,
        pic_url: data['pic_url'],
        details: data['details'],
        price: data['price']
    );
  }
}