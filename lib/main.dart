import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: HomeScreen(),
        title: Text(
          'Welcome to the DateTime Picker',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset(
          'images/datetime.jpg',
        ),
        backgroundColor: Colors.deepOrangeAccent,
        loaderColor: Colors.white,
        photoSize: 100,
      ),
    );
  }
}
