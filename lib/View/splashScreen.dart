import 'dart:async';

import 'package:flutter/material.dart';
import 'package:panchprana/View/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //go to home screen
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logoImage",
              child: Image.asset(
                'assets/logo.png',
                height: 100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Panch Prana',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Five pranayamas for healthy life...',
              style: TextStyle(fontSize: 16, letterSpacing: 2),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Made with "),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Text(" by OM KALE")
              ],
            )
          ],
        ),
      ),
    );
  }
}
