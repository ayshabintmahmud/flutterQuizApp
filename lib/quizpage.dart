import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterquizz/resultpage.dart';



class getjson extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/flutter.json"),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading...",
              ),
            ),
          );
        } else {
          return quizpage(mydata: mydata);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {

  var mydata;

  quizpage({Key key, @required this.mydata}): super(key : key);


  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {

  var mydata;
  _quizpageState(this.mydata);

  Color colortoshow = Colors.pink;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  //int timer = 30;
  int Questions = 5;
  int QuestionCounter = 1;
  int counter = 0;


  Map<String, Color> btncolor = {
    "a": Colors.pink,
    "b": Colors.pink,
    "c": Colors.pink,
    "d": Colors.pink,
  };


    //bool canceltimer = false;

  @override
  void initState() {
    super.initState();
  }



  void nextquestion(){
    //canceltimer = false;
    //timer = 30;
    setState(() {
    if(i < 5){
      QuestionCounter = QuestionCounter + 1;
      i++;
    }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks : marks),
        ));
    }
    btncolor["a"] = Colors.pink;
    btncolor["b"] = Colors.pink;
    btncolor["c"] = Colors.pink;
    btncolor["d"] = Colors.pink;
    });


  }



  void checkanswer(String k){
    if (mydata[2]["1"] == mydata[1]["1"][k]){
      marks = marks + 1;
      counter = counter + 1;
      //QuestionCounter = QuestionCounter + 1;
      colortoshow = right;
    }else if(mydata[2]["1"] != mydata[1]["1"][k]){
      colortoshow = wrong;
      //QuestionCounter = QuestionCounter + 1;
    } else
    {
      colortoshow = null;
    }

    setState((){
        btncolor[k] = colortoshow;
       // canceltimer = true;

    });

    Timer(Duration(seconds: 1 ), nextquestion);

  }

  Widget choicebutton(String k){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.pink[700],
        highlightColor: Colors.pink[800],
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20.0)),

    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return WillPopScope(
      onWillPop: (){
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Flutter Quiz"
            ),
            content: Text(
              "You can't Go Back at this point"
            ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                  ),
                )
              ],
          ),
        );
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(

                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Question $QuestionCounter 0f $Questions",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),


            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()],

                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(

                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Score Count : $counter",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topCenter,
                child: MaterialButton(
                  onPressed: () => nextquestion(),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    maxLines: 1,
                  ),
                  color: Colors.blue,
                  splashColor: Colors.pink[700],
                  highlightColor: Colors.pink[800],
                  minWidth: 200.0,
                  height: 45.0,
                  shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

