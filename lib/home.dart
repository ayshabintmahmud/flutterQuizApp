import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterquizz/quizpage.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {


  Widget customcard(String cardName){
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        child: Center(

        child: Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),

          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:10.0,
                  ),
                  child: Material(
                    child: Container(
                      child: ClipOval(
                        child: Image(
                          width: 200.0,
                          height: 300.0,
                          image: AssetImage(
                              ("assets/images/quiz.png")
                          ),
                        ),
                      ),
                        ),
                  ),
                ),
                  Center(
                    child: Text(
                      cardName,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "This quiz test your basic flutter knowledge. \n Take it slow and steady\n Its the very basics of flutter. \n You got This! Start.",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.pink,
                      ),
                      maxLines: 5,
                      textAlign: TextAlign.justify,
                    ),

                  ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                          shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20.0)),
                          textColor: Colors.white,
                          color: Colors.pink,
                          child: Text(
                            'Start Quiz',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (contex) => getjson(),
                            ));
                            //Navigator.push(
                             // context,
                            // MaterialPageRoute(builder: (context) => SecondPage()),
                           // );//signup screen
                          },
                        )
                      ],
                     // mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Quiz",
        )
      ),
      body: ListView(
        children: <Widget>[
          customcard("Welcome to the FlutterQuiz"),

        ],
      ),
    );
  }
}

