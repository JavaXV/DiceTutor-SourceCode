// ignore_for_file: camel_case_types, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use, avoid_print

import 'dart:convert';

import 'package:dicetutormobile/confirmedmessage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:http/http.dart' as http;

import 'api.dart';

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
      home: verifymail(),
    );
  }
}

class verifymail extends StatefulWidget {
  const verifymail({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<verifymail> {
  TextEditingController digitvalue = TextEditingController();

  Future confirmed() async {
    if (digitvalue.text == "") {
      Fluttertoast.showToast(
          msg: "Please all field are required",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      var data = {
        "digitvalue": digitvalue.text,
      };
      var res = await VerifyMailApi().postData(data, 'emailverify');
      var body = json.decode(res.body);
      if (body['Success']) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const confirmedmessage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const verifymail()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 1000,
            height: 320,
            color: Colors.white,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 40.0),
                height: 650,
                width: 300,
                child: const Image(
                  image: AssetImage('lib/mobile/page007.jpg'),
                  colorBlendMode: BlendMode.overlay,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 300,
            height: 65,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: TextField(
                    controller: digitvalue,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Verication Code',
                      hintText: 'Enter Code',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 20,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 40,
            color: Colors.white60,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 200,
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.yellowAccent,
                  padding: const EdgeInsets.all(8.0),
                  splashColor: Colors.yellowAccent,
                  onPressed: () {
                    confirmed();
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
