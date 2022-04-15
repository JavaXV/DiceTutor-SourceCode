// ignore_for_file: camel_case_types, deprecated_member_use, unused_local_variable, import_of_legacy_library_into_null_safe, unused_import, avoid_print, non_constant_identifier_names

//import 'dart:html';

import 'dart:convert';
//import 'dart:js';

import 'package:dicetutormobile/mailnotice.dart';
import 'package:dicetutormobile/mailnotice2.dart';
import 'package:dicetutormobile/signin.dart';
import 'package:dicetutormobile/verifyemail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'mailnoice1.dart';
import 'process.dart';

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
      home: signupschool(),
    );
  }
}

class signupschool extends StatefulWidget {
  const signupschool({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<signupschool> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();

  Future register(BuildContext cont) async {
    if (firstname.text == "" ||
        pass.text == "" ||
        cpass.text == "" ||
        lastname.text == "" ||
        email.text == "") {
      Fluttertoast.showToast(
          msg: "Please all field are required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (pass.text != cpass.text) {
      Fluttertoast.showToast(
          msg: "Please Password must be the same ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Navigator.push(
        cont,
        MaterialPageRoute(builder: (context) => const mailnotice2()),
      );
      var Url = 'http://169.254.80.80/dicetutormobile/accountschool.php';
      var response = await http.post(Uri.parse(Url), body: {
        "firstname": firstname.text,
        "lastname": lastname.text,
        "email": email.text,
        "password": pass.text,
        "cpassword": cpass.text,
      });
      var data = json.decode(response.body);
      if (data == "Success") {
        debugPrint(data);
      } else {}
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
                "Sign Up",
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
                textAlign: TextAlign.left,
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
                    controller: firstname,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                      hintText: 'Enter First Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
              ],
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
                    controller: lastname,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                      hintText: 'Enter Last Name',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //-----------------------------------------------------------------
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
                    controller: email,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
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
            width: 300,
            height: 65,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: TextField(
                    controller: pass,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password),
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
                    controller: cpass,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
              ],
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
                  color: Colors.blue,
                  textColor: Colors.yellowAccent,
                  padding: const EdgeInsets.all(8.0),
                  splashColor: Colors.yellowAccent,
                  onPressed: () {
                    register(context);
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up",
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
