import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterquizz/home.dart';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key, @required this.marks}) : super(key : key);

  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {

  List<String> images = [
    "assets/images/success.png",
    "assets/images/good.png",
    "assets/images/bad.png",
  ];

  String message;
  String image;


  @override
  void initState(){
    if(marks < 1){
      image = images[2];
      message = "That's Low! Try Harder Next time \n " + "You Scored $marks";
    }else if(marks <= 4){
      image = images[1];
      message = "That's Good! You can do better Next time \n " + "You Scored $marks";

    }else{
      image = images[0];
      message = "Amazing! You rocked it \n " + "You Scored $marks";

    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Result"
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded (
            flex: 7,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            width: 200.0,
                            height: 50.0,
                            image: AssetImage(
                               image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,
                      ),
                      child: Center(
                        child: Text(
                          message,
                          style: TextStyle(
                              fontSize: 25.0
                          ),
                        ),
                      ),
                    ),

                  ],
                )
              ),
            ),
          ),
          Expanded (
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => homepage(),
                    ));
                  },
                  child: Text(
                    "Play Again",
                    style: TextStyle(
                      fontSize: 18.0,

                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,

                    ),
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Colors.pink,
                  ),
                  splashColor: Colors.pinkAccent,
                ),
              ],
            ),

          ),
        ],
      )
    );
  }
}
