import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lotto/model/numbers.dart';

class Dates {
  List dates;
  Numbers number;
  String savedDate;
  String saverId;
  Timestamp saveDate;
  int drwNo1;
  int drwNo2;
  int drwNo3;
  int drwNo4;
  int drwNo5;
  int drwNo6;

  Dates({
    this.number,
    this.savedDate
  });

  Map toMap() {
    var map = Map<String, dynamic>();
    map['number'] = this.number;
    map['savedDate'] = this.savedDate;

    return map;
  }

  // Named constructor
  Dates.fromMap(Map<String, dynamic> map) {
    this.number = map['numbers'];
    this.savedDate = map['saved'];


  }
}