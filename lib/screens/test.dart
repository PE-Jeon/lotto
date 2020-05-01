
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lotto/model/numbers.dart';
import 'package:lotto/utils/getcolor.dart';

class test extends StatefulWidget {

  test({
    this.currentUserId,
  });

  final String currentUserId;

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  ScrollController _listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              testFunc();
            }
          ),
          Flexible(
              child: viewLists() //show data in documents
          ),
          /*Flexible(
              child: viewLists() //show collection names
          ),*/
        ],
      )
    );
  }

  Widget viewLists() {
    return StreamBuilder(
        stream: Firestore.instance
        .collection("numbers")
        .document(widget.currentUserId)
        .collection("2020-03-12")
        .snapshots(),
     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return Text('Erorr: ${snapshot.error}');
      return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
          itemCount: snapshot.data.documents.length,
          reverse: false,
          controller: _listScrollController,
        itemBuilder: (context, index) {
      return testItem(snapshot.data.documents[index]);
      });
    });
  }

  Widget testItem(DocumentSnapshot snapshot) {
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


  /*static List<Numbers> NumbersLists = [];

  CreateListofCourses(QuerySnapshot snapshot) async
  {
    var docs = snapshot.documents;
    print('createListof Corses docs');
    print(docs);
    for (var Doc in docs)
    {
      NumbersLists.add(Numbers.fromMap());
    }
  }*/


  /*
  show document ids
  */

  Widget showDocId() {
    return StreamBuilder(
        stream: Firestore.instance
            .collection("numbers")
            .document(widget.currentUserId)
            .collection("2020-03-12")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              itemCount: snapshot.data.documents.length,
              reverse: false,
              controller: _listScrollController,
              itemBuilder: (context, index) {
                return testItem(snapshot.data.documents[index]);
              });
        });
  }

  testFunc() {
    print('test Func');
    print(
    Firestore.instance
        .collection("numbers")
        .document(widget.currentUserId)
        .snapshots()
        .toList()
    );


    Firestore.instance
        .collection("numbers")
        .document(widget.currentUserId)
        .get()
        .then((DocumentSnapshot ds) {
          print("currentUserId");
          print(widget.currentUserId);
          print("ds");
          print(ds);
          print("ds.data");
          print(ds.data);
          print("ds.documentID");
          print(ds.documentID);
          //print(ds.reference.get(source: ds));
          print(ds.hashCode);
          print(ds.documentID);
          print(ds.runtimeType);
          print(ds.metadata);
          print("documentID list");
          print(ds.documentID.length);
          print(ds.documentID);
          print(ds.documentID);
          print(ds.documentID);
          print(ds.documentID);
    }
    );
  }

}
