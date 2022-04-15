// ignore_for_file: camel_case_types, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use

import 'package:dicetutormobile/process.dart';
import 'package:dicetutormobile/verifyemail.dart';

//import 'package:dicetutormobile/signin.dart';
import 'package:flutter/material.dart';

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
      home: process1(),
    );
  }
}

class process1 extends StatefulWidget {
  const process1({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<process1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 1000,
            height: 300,
            color: Colors.white,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 50.0),
                child: const Image(
                  image: AssetImage('lib/mobile/Dice Tutuors.png'),
                  colorBlendMode: BlendMode.overlay,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 90,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 90,
            color: Colors.white,
            child: Center(
              child: SizedBox(
                height: 50,
                width: 250,
                child: FlatButton(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  splashColor: Colors.deepPurpleAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const process()),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text("Get Started",
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
          ),
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
                      MaterialPageRoute(
                          builder: (context) => const verifymail()),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign In",
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
