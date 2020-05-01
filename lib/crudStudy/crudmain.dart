import 'package:flutter/material.dart';
import 'package:lotto/crudStudy/core/viewmodels/CRUDEModel.dart';
import 'package:lotto/crudStudy/locator.dart';
import 'package:lotto/crudStudy/ui/router.dart';
import 'package:provider/provider.dart';

void crudmain() {
  setupLocator();
  runApp(MyAppCRUD());
}

class MyAppCRUD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<CRUDModel>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'Product App',
        theme: ThemeData(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
