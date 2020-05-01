import 'package:cloud_firestore/cloud_firestore.dart';

class Numbers {
  String saverId;
  String saveDate;
  Timestamp saveTime;
  int drwNo1;
  int drwNo2;
  int drwNo3;
  int drwNo4;
  int drwNo5;
  int drwNo6;

  Numbers({
    this.saverId,
    this.saveDate,
    this.saveTime,
    this.drwNo1,
    this.drwNo2,
    this.drwNo3,
    this.drwNo4,
    this.drwNo5,
    this.drwNo6,
  });

  Map toMap() {
    var map = Map<String, dynamic>();
    map['saverId'] = this.saverId;
    map['saveDate'] = this.saveDate;
    map['saveTime'] = this.saveTime;
    map['drwNo1'] = this.drwNo1;
    map['drwNo2'] = this.drwNo2;
    map['drwNo3'] = this.drwNo3;
    map['drwNo4'] = this.drwNo4;
    map['drwNo5'] = this.drwNo5;
    map['drwNo6'] = this.drwNo6;
    return map;
  }

  // Named constructor
  Numbers.fromMap(Map<String, dynamic> map) {
    this.saverId = map['saverId'];
    this.saveDate = map['saveDate'];
    this.saveTime = map['saveTime'];
    this.drwNo1 = map['drwNo1'];
    this.drwNo2 = map['drwNo2'];
    this.drwNo3 = map['drwNo3'];
    this.drwNo4 = map['drwNo4'];
    this.drwNo5 = map['drwNo5'];
    this.drwNo6 = map['drwNo6'];
  }
}