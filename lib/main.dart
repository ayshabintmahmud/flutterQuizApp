import 'package:flutter/material.dart';
import 'package:flutterquizz/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Flutter Quizz App',
      theme: ThemeData(

        primarySwatch: Colors.pink,
      ),
      home: splashscreen(),
    );
  }
}