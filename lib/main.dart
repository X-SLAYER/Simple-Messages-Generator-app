import 'package:flutter/material.dart';
import 'package:my_messanger/Pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor: Colors.redAccent),
      home: HomePage(),
    );
  }
}