import 'package:cloud_firestore/cloud_firestore.dart';

class Numbers {
  String saverId;
  Timestamp saveDate;
  String returnValue;     //https request result
  String totSellamnt;     //total amount of sales
  String firstPrzwnerCo;  //first winner numbers
  String firstWinamnt;    //first winners amount
  String drwNoDate;       //date
  String firstAccumamnt;  //first winners total amount
  int drwNo;              //number of games
  int drwNo1;
  int drwNo2;
  int drwNo3;
  int drwNo4;
  int drwNo5;
  int drwNo6;
  int bnusNo;


  Numbers({
    this.saverId,
    this.saveDate,
    this.returnValue,
    this.totSellamnt,
    this.firstPrzwnerCo,
    this.firstWinamnt,
    this.drwNoDate,
    this.firstAccumamnt,
    this.drwNo,
    this.drwNo1,
    this.drwNo2,
    this.drwNo3,
    this.drwNo4,
    this.drwNo5,
    this.drwNo6,
    this.bnusNo,
  });

  Map toMap() {
    var map = Map<String, dynamic>();
    map['saverId'] = this.saverId;
    map['saveDate'] = this.saveDate;
    map['returnValue'] = this.returnValue;
    map['totSellamnt'] = this.totSellamnt;
    map['firstPrzwnerCo'] = this.firstPrzwnerCo;
    map['firstWinamnt'] = this.firstWinamnt;
    map['drwNoDate'] = this.drwNoDate;
    map['firstAccumamnt'] = this.firstAccumamnt;
    map['drwNo'] = this.drwNo;
    map['drwNo1'] = this.drwNo1;
    map['drwNo2'] = this.drwNo2;
    map['drwNo3'] = this.drwNo3;
    map['drwNo4'] = this.drwNo4;
    map['drwNo5'] = this.drwNo5;
    map['drwNo6'] = this.drwNo6;
    map['bnusNo'] = this.bnusNo;
    return map;
  }

  // Named constructor
  Numbers.fromMap(Map<String, dynamic> map) {
    this.saverId = map['saverId'];
    this.saveDate = map['saveDate'];
    this.returnValue = map['returnValue'];
    this.totSellamnt = map['totSellamnt'];
    this.firstPrzwnerCo = map['firstPrzwnerCo'];
    this.firstWinamnt = map['firstWinamnt'];
    this.drwNoDate = map['drwNoDate'];
    this.firstAccumamnt = map['firstAccumamnt'];
    this.drwNo = map['drwNo'];
    this.drwNo1 = map['drwNo1'];
    this.drwNo2 = map['drwNo2'];
    this.drwNo3 = map['drwNo3'];
    this.drwNo4 = map['drwNo4'];
    this.drwNo5 = map['drwNo5'];
    this.drwNo6 = map['drwNo6'];
    this.bnusNo = map['bnusNo'];
  }
}