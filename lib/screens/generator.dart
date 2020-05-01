import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lotto/model/numbers.dart';
import 'package:lotto/utils/database.dart';
import 'package:lotto/utils/firebase_repository.dart';
import 'package:lotto/utils/getcolor.dart';
import 'package:lotto/utils/randomnumber.dart';
import 'package:lotto/utils/file_ctrl.dart';

/*
generator 페이지는 번호를 추첨하는 화면임
여기서 마음에 드는 번호가 있으면 저장하면 saved 페이지에서 확인 할 수 있음
generate 방식은 세가지 정도 화면으로 분류 할 수 있게끔하단에 버튼 추가 필요

*/

class generator extends StatefulWidget {
  generator({
    this.currentUserId,
  });

  final String currentUserId;

  @override
  _generatorState createState() => _generatorState();
}

class _generatorState extends State<generator> {
  FirebaseRepository _repository = FirebaseRepository();
  bool _numberChanged = false;
  bool savedExecuted = true;
  String _currentUserId;
  FileController _fileController = FileController();

  var list = List<int>.generate(44, (int index) => index);

  getUser() {
    _repository.getCurrentUser().then((user) {
      _currentUserId = user.uid;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  saveNumbers() {
    getUser();
    Numbers _numbers = Numbers(
      saverId: _currentUserId,
      saveDate: Timestamp.now().toDate().toString().split(" ")[0],
      saveTime: Timestamp.now(),
      drwNo1: list[0],
      drwNo2: list[1],
      drwNo3: list[2],
      drwNo4: list[3],
      drwNo5: list[4],
      drwNo6: list[5],
    );

    _repository.saveCurrentNumber(_numbers);
    savedExecuted = false;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentUserId);
    print("generator");
    getUser();
    list = new List<int>.generate(44, (int index) => index);
    shuffleNo(list);

    return Scaffold(
      appBar: AppBar(
        title: Text('Generator Page'),
      ),
      body: Column(






        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  numberStack(list[0]),
                  numberStack(list[1]),
                  numberStack(list[2]),
                  numberStack(list[3]),
                  numberStack(list[4]),
                  numberStack(list[5]),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  if (savedExecuted) {
                    print(list);
                    saveNumbers();
                  } else {
                    print("renew must be executed");
                  }
                },
                child: Text('save'),
              ),
              RaisedButton(
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      this._numberChanged = true;
                    });
                  });
                  list = new List<int>.generate(44, (int index) => index);
                  shuffleNo(list);
                  savedExecuted = true;
                },
                child: Text('renew'),
              ),
              RaisedButton(
                  onPressed: () {
                    test().sqlTest();
                  },
                child: Text('text'),

              ),

              /*RaisedButton(
                onPressed: null,
                child: Text('chanage mode'),
              ),*/
            ],
          )
        ],
      ),
    );
  }

  Widget numberStack(int number) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(8.0),
            width: 35,
            height: 35,
            color: getColor(number),),
          Text(number.toString()),
      ],
    );
  }
}
