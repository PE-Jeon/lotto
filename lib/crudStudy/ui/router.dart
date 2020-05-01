import 'package:flutter/material.dart';
import 'package:lotto/crudStudy/ui/views/addProduct.dart';
import 'package:lotto/crudStudy/ui/views/homeView.dart';
import 'package:lotto/crudStudy/ui/views/productDetails.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
            builder: (_)=> HomeView()
        );
      case '/addProduct' :
        return MaterialPageRoute(
            builder: (_)=> AddProduct()
        ) ;
      case '/productDetails' :
        return MaterialPageRoute(
            builder: (_)=> ProductDetails()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}