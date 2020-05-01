import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lotto/constants/strings.dart';
import 'package:lotto/model/dates.dart';
import 'package:lotto/model/numbers.dart';
import 'package:lotto/model/user.dart';
import 'package:lotto/utils/getcolor.dart';

/*
saved 페이지는 generator 페이지에서 사용자가 저장한 내용들이 등재되는 화면

*/

class saved extends StatefulWidget {
  saved({
    this.currentUserId,
  });

  final String currentUserId;

  @override
  _savedState createState() => _savedState();
}

class _savedState extends State<saved> {
  ScrollController _listScrollController = ScrollController();

  User saverId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentUserId);
    print("saved");
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Screen'),
      ),
      body: Column(
        children: <Widget>[
          Text('test'),
          RaisedButton(
            onPressed: () {
              asyncFunction();
            },
          ),
          Flexible(
            child: numberList(),
          ),
          Text('bottom bar'),
          Text('adds bar'),
        ],
      ),
    );
  }

  Widget numberList() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection(NUMBERS_COLLECTION)
          .document(widget.currentUserId)
          .collection("saved")
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }

        // SchedulerBinding.instance.addPostFrameCallback((_) {
        //   _listScrollController.animateTo(
        //     _listScrollController.position.minScrollExtent,
        //     duration: Duration(milliseconds: 250),
        //     curve: Curves.easeInOut,
        //   );
        // });

        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          itemCount: snapshot.data.documents.length,
          reverse: false,
          controller: _listScrollController,
          itemBuilder: (context, index) {
            // mention the arrow syntax if you get the time
            return numberItem(snapshot.data.documents[index]);
          },
        );
      },
    );
  }

  Widget numberItem(DocumentSnapshot snapshot) {
    Numbers _numbers = Numbers.fromMap(snapshot.data);
    //Dates _dates = Dates.fromMap(snapshot.data);
    print("numberItem");
    print(snapshot.documentID.toString());

    return Container(
      child: savedLayout(_numbers),
      //child: savedLayout(_dates),
    );
  }

  Widget savedLayout(Numbers numbers) {
    //Widget savedLayout(Dates dates) {
    Radius messageRadius = Radius.circular(10);

    return Container(
      margin: EdgeInsets.only(top: 12),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.65),
      decoration: BoxDecoration(
        color: Colors.blueGrey, //UniversalVariables.senderColor,
        borderRadius: BorderRadius.only(
          topLeft: messageRadius,
          topRight: messageRadius,
          bottomLeft: messageRadius,
        ),
      ),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              //Text(dates.savedDate.toString()),
              //Text(numbers.toString()),
              //Text(numbers.saverId.toString()),
              numberStack(numbers.drwNo1),
              numberStack(numbers.drwNo2),
              numberStack(numbers.drwNo3),
              numberStack(numbers.drwNo4),
              numberStack(numbers.drwNo5),
              numberStack(numbers.drwNo6),
            ],
          )),
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
          color: getColor(number),
        ),
        Text(number.toString()),
      ],
    );
  }

  Future<int> asyncFunction() async {
  final CollectionReference result =
      await Firestore.instance.collection(NUMBERS_COLLECTION);
  //final List<CollectionReference> documents = result;

  print(result.document());
  }
}
