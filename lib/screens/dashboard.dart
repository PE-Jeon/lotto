import 'package:flutter/material.dart';
import 'package:lotto/screens/generator.dart';
import 'package:lotto/screens/history.dart';
import 'package:lotto/screens/saved.dart';
import 'package:lotto/screens/student_sql.dart';
import 'package:lotto/screens/test.dart';
import 'package:lotto/test2.dart';
import 'package:lotto/utils/firebase_repository.dart';

class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  FirebaseRepository _repository = FirebaseRepository();
  String _currentUserId;

  getUser() {
    _repository.getCurrentUser().then((user) {
      _currentUserId = user.uid;
    });
  }

  PageController _controller = PageController(
    initialPage: 1,
  );

  @override
  void initState() {
    super.initState();

    getUser();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//slide page릉 위한 PageView 예제 사이트
//https://medium.com/flutter-community/flutter-pageview-widget-e0f6c8092636

  @override
  Widget build(BuildContext context) {

    getUser();

    return PageView(
      controller: _controller,
      children: <Widget>[
        saved(currentUserId: _currentUserId),
        generator(currentUserId: _currentUserId),
        //FlutterDemo(),
        history(),
        StudentPage(),
      ],
    );

    /*return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('go to right slide'),
                onPressed: () => Navigator.push(context, SlideRightRoute(page: generator()))
            ),
            RaisedButton(
                child: Text('go to left slide'),
                onPressed: () => Navigator.push(context, SlideLeftRoute(page: history()))
            ),
          ],
        )
      ),
    );*/
  }
}
