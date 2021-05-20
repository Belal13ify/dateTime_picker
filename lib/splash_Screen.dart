import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'homeScreen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: HomeScreen(),
      title: Text(
        'Welcome to the DateTime Picker',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
      ),
      image: Image.asset(
        'images/datetime.jpg',
      ),
      backgroundColor: Colors.deepOrangeAccent,
      loaderColor: Colors.white,
      photoSize: 100,
    );
  }
}
