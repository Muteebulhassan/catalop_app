import 'package:flutter/material.dart';
import 'package:flutter_app/pages/cart_page.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/utils/routes.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.logOut: (context) => Login(),
      },
      initialRoute: MyRoutes.loginRoute,
    );
  }
}

