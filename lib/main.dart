import 'package:flutter/material.dart';
import 'package:panchprana/View/splashScreen.dart';

void main() {
  runApp(MyApp());
}

//Coded BY- Om Arvind Kale
//This was my minor project for internship
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panch Prana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
