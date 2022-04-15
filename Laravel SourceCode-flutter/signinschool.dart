// ignore_for_file: camel_case_types, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use, non_constant_identifier_names, import_of_legacy_library_into_null_safe

// import 'dart:convert';

import 'dart:convert';

import 'package:dicetutormobile/confirmedmessage2.dart';
import 'package:dicetutormobile/process1.dart';
import 'package:dicetutormobile/process2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:fluttertoast/fluttertoast.dart";
//import 'dart:io';

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
      home: signinschool(),
    );
  }
}

class signinschool extends StatefulWidget {
  const signinschool({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<signinschool> {
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login(BuildContext cont) async {
    if (username.text == "" || pass.text == "") {
      Fluttertoast.showToast(
          msg: "Please all field are required ",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 20.0);
    } else {
      var Url = 'http://169.254.80.80/dicetutormobile/AccountCreation2.php';
      var response = await http.post(Uri.parse(Url), body: {
        "username": username.text,
        "password": pass.text,
      });
      var data = json.decode(response.body);
      if (data == "Success") {
        debugPrint(data);
        Navigator.push(
          cont,
          MaterialPageRoute(builder: (context) => const confirmedmessage2()),
        );
      } else {
        Fluttertoast.showToast(
            msg: "Invalid Email or Password",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
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
            height: 80,
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 40.0, color: Colors.blue),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            width: 1000,
            height: 80,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 350,
            height: 65,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: TextField(
                    controller: username,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter Email Address',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 350,
            height: 65,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //-----------------------------------------------------------------
          //-----------------------------------------------------------------

          //-----------------------------------------------------------------
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 44.0, vertical: 2.0),
            child: Container(
              // padding: const EdgeInsets.only(right: 80.0),
              width: 600,
              height: 15,
              color: Colors.white,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const process1()),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Forget password?",
                      style: TextStyle(fontSize: 12.0, color: Colors.green),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 50,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 50,
            color: Colors.white60,
            child: Center(
              child: SizedBox(
                height: 50,
                width: 270,
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.yellowAccent,
                  padding: const EdgeInsets.all(8.0),
                  splashColor: Colors.yellowAccent,
                  onPressed: () {
                    login(context);
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
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 30,
            color: Colors.white,
            child: const Center(),
          ),
          //---
          //-----------------------------------------------------------------
          Container(
            width: 600,
            height: 15,
            color: Colors.white,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const process2()),
                  );
                },
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Don't have an account?  Sign Up",
                    style: TextStyle(fontSize: 12.0, color: Colors.purple),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
