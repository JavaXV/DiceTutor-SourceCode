// ignore_for_file: camel_case_types, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use

import 'package:dicetutormobile/signin.dart';
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
      home: confirmedmessage(),
    );
  }
}

class confirmedmessage extends StatefulWidget {
  const confirmedmessage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<confirmedmessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        children: [
          Container(
            width: 1000,
            height: 500,
            color: Colors.white,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                height: 500,
                width: 350,
                child: const Image(
                  image: AssetImage('lib/mobile/page008.jpg'),
                  colorBlendMode: BlendMode.overlay,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------

          //-----------------------------------------------------------------

          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 40,
            color: Colors.white60,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 250,
                child: FlatButton(
                  color: Colors.blue,
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
                      "Proceed To Login",
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
