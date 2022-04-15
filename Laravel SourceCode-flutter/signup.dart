// ignore_for_file: camel_case_types, deprecated_member_use, unused_local_variable, import_of_legacy_library_into_null_safe, unused_import, avoid_print, non_constant_identifier_names

//import 'dart:html';

import 'dart:convert';
//import 'dart:js';

import 'package:dicetutormobile/mailnotice.dart';
import 'package:dicetutormobile/signin.dart';
import 'package:dicetutormobile/verifyemail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'api.dart';
import 'mailnotice2.dart';
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
      home: signup(),
    );
  }
}

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<signup> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();

  Future registers(BuildContext cont) async {
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
      var data = {
        "firstname": firstname.text,
        "lastname": lastname.text,
        "email": email.text,
        "password": pass.text,
        "cpassword": cpass.text,
      };
      var res = await CallApi().postData(data, 'register');
      var body = json.decode(res.body);
      if (body['Success']) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const mailnotice()),
        );
      } else if (body == 'Error') {
        Fluttertoast.showToast(
            msg: "Please Password must be the same ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 110,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            //-----------------------------------------------------------------
            Container(
              height: 75,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
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
              height: 1,
              color: Colors.white,
              child: const Center(),
            ),
            //-----------------------------------------------------------------
            Container(
              height: 75,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
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
            Container(
              height: 1,
              color: Colors.white,
              child: const Center(),
            ),
            //-----------------------------------------------------------------
            Container(
              height: 75,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
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
              height: 1,
              color: Colors.white,
              child: const Center(),
            ),
            //-----------------------------------------------------------------
            Container(
              height: 75,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
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
              height: 1,
              color: Colors.white,
              child: const Center(),
            ),
            //-----------------------------------------------------------------
            Container(
              height: 75,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
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
              height: 80,
              color: Colors.white,
              child: const Center(),
            ),
            //-----------------------------------------------------------------

            //-----------------------------------------------------------------
            Container(
              color: Colors.yellow,
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
                      registers(context);
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
      ),
    );
  }
}
