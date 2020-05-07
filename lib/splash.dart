import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterquizz/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (contex) => homepage(),
    ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Text(
          "Flutter Quiz",
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.white,
          ),
        ),
      ),




    );
  }
}
