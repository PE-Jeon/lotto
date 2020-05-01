import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lotto/crudStudy/crudmain.dart';
import 'package:lotto/screens/dashboard.dart';
import 'package:lotto/screens/generator.dart';
import 'package:lotto/screens/history.dart';
import 'package:lotto/screens/login_screen.dart';
import 'package:lotto/screens/saved.dart';
import 'package:lotto/test.dart';
import 'package:lotto/test2.dart';
import 'package:lotto/utils/firebase_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseRepository _repository = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/login': (context) => dashboard(),
        //'/generator': (context) => generator(),
        //'/history' : (context) => history(),
        //'/saved' : (context) => saved(),
      },
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return dashboard();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
