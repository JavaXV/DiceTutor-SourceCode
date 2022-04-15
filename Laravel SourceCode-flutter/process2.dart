// ignore_for_file: camel_case_types, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use, unused_import

import 'package:dicetutormobile/mailnotice.dart';
import 'package:dicetutormobile/process.dart';
import 'package:dicetutormobile/signin.dart';
import 'package:dicetutormobile/signup.dart';
import 'package:dicetutormobile/signupparent.dart';
import 'package:dicetutormobile/signupschool.dart';
import 'package:dicetutormobile/verifyemail.dart';
import 'package:flutter/material.dart';

import 'signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: process2(),
    );
  }
}

class process2 extends StatefulWidget {
  const process2({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<process2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 500,
            height: 110,
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 100,
            color: Colors.white,
            child: Center(
              child: SizedBox(
                height: 60,
                width: 290,
                child: FlatButton(
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  splashColor: Colors.deepPurpleAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const signup()),
                    );
                  },
                  child: Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 46.0),
                        child: Icon(
                          Icons.pie_chart,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'TUTOR',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 2,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 50,
            color: Colors.white,
            child: Center(
              child: SizedBox(
                height: 60,
                width: 290,
                child: FlatButton(
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(12.0),
                  splashColor: Colors.deepPurpleAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const signupparent()),
                    );
                  },
                  child: Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 46.0),
                        child: Icon(
                          Icons.school,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'PARENT/SELF',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 2,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 900,
            height: 100,
            color: Colors.white,
            child: Center(
              child: SizedBox(
                height: 60,
                width: 290,
                child: FlatButton(
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(12.0),
                  splashColor: Colors.deepPurpleAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const signupschool()),
                    );
                  },
                  child: Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 40.0),
                        child: Icon(
                          Icons.house,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'SCHOOL',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 80,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------

          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 50,
            color: Colors.white60,
            child: Center(
              child: SizedBox(
                height: 50,
                width: 250,
                child: FlatButton(
                  color: Colors.blueGrey,
                  textColor: Colors.yellowAccent,
                  padding: const EdgeInsets.all(8.0),
                  splashColor: Colors.yellowAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const signin()),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
