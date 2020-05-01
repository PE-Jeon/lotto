import 'package:flutter/material.dart';

/*
history 페이지는 현재까지 담첨된 이력들을 보여줌
firebase에 저장된 내용을 보여주는 페이지임
*/
class history extends StatefulWidget {
  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
        body: SizedBox(
          child: Column(

          ),
        )
    );
  }
}
