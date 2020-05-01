import 'package:cloud_firestore/cloud_firestore.dart';

class number_2 {
  String saverId;
  Timestamp saveDate;
  String pdate;
  int drwNo1;
  int drwNo2;
  int drwNo3;
  int drwNo4;
  int drwNo5;
  int drwNo6;

  number_2({
    this.pdate,
    this.saverId,
    this.saveDate,
    this.drwNo1,
    this.drwNo2,
    this.drwNo3,
    this.drwNo4,
    this.drwNo5,
    this.drwNo6,
  });

  factory number_2.fromFireStore(DocumentSnapshot doc)
  {
    Map data = doc.data ;
    return number_2(
        saverId: data['saverId'],
        saveDate: data['saveDate'],
        drwNo1: data['drwNo1'],
        drwNo2: data['drwNo2'],
        drwNo3: data['drwNo3'],
        drwNo4: data['drwNo4'],
        drwNo5: data['drwNo5'],
        drwNo6: data['drwNo6'],
    );
  }
}