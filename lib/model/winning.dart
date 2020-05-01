import 'package:cloud_firestore/cloud_firestore.dart';

class Winning {
  int totSellamnt;		//누적 금
  int drwNo;		//회차
  String drwNoDate;//당첨일
  int firstWinamnt;		//1등 당첨금
  int firstPrzwnerCo;		//1등 당첨 인원
  int firstAccumamnt;		//1등 당첨금 총액
  int drwtNo1;			//당첨번호1
  int drwtNo2;			//당첨번호2
  int drwtNo3;			//당첨번호3
  int drwtNo4;			//당첨번호4
  int drwtNo5;			//당첨번호5
  int drwtNo6;			//당첨번호6
  int bnusNo;			//보너스번호

  Winning({
  this.totSellamnt,
  this.drwNo,
  this.drwNoDate,
  this.firstWinamnt,
  this.firstPrzwnerCo,
  this.firstAccumamnt,
  this.drwtNo1,
  this.drwtNo2,
  this.drwtNo3,
  this.drwtNo4,
  this.drwtNo5,
  this.drwtNo6,
  this.bnusNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'totSellamnt' : totSellamnt,
      'drwNo' : drwNo,
      'drwNoDate' : drwNoDate,
      'firstWinamnt' : firstWinamnt,
      'firstPrzwnerCo' : firstPrzwnerCo,
      'firstAccumamnt' : firstAccumamnt,
      'drwtNo1' : drwtNo1,
      'drwtNo2' : drwtNo2,
      'drwtNo3' : drwtNo3,
      'drwtNo4' : drwtNo4,
      'drwtNo5' : drwtNo5,
      'drwtNo6' : drwtNo6,
      'bnusNo' : bnusNo,
    };
  }
}