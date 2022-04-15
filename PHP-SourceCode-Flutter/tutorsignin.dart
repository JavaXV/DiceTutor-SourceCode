// ignore_for_file: camel_case_types, import_of_legacy_library_into_null_safe, non_constant_identifier_names, unrelated_type_equality_checks, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/MyHomePage.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/forgetpassword.dart';
import 'package:untitled2/tutorhome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future<dynamic>token = FlutterSession().get('token');
  runApp( MaterialApp(home: token != '' ? tutorhome() : tutorsignin(),));
}

class tutorsignin extends StatefulWidget {
  const tutorsignin({Key? key}) : super(key: key);

  @override
  State<tutorsignin> createState() => _tutorsigninState();
}

class _tutorsigninState extends State<tutorsignin> {
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    if (username.text == "" || pass.text == "") {
      Fluttertoast.showToast(
          msg: "Please all field are required",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 20.0);
    } else {
      var Url = 'http://192.168.43.29/dicetutormobile/AccountCreation.php';
      var response = await http.post(Uri.parse(Url), body: {
        "username": username.text,
        "password": pass.text,
      });
      var data = json.decode(response.body);
      if (data == "Success") {
        await FlutterSession().set('token', username.text);
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const tutorhome(),),);
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
            height: 32,
            color: Colors.white,
          ),
          Container(
            width: 1000,
            height: 39,
            color: Colors.white,

              child: const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 8.0),
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  textAlign: TextAlign.left,
                ),
            ),
          ),
          Container(
            width: 1000,
            height: 30,
            color: Colors.white,
            child: const Center(),
          ),
          //--------------------------------------------
          Container(
            height: 80,
            margin: const EdgeInsets.all(12),
            child: TextFormField(
              style: const TextStyle(
                height: 3,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              controller: username,
              decoration: InputDecoration(
                labelText: "Emailaddress",
                prefixIcon: const Icon(Icons.email),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(
                horizontal: 15.0, vertical: 2.0),

            child: TextFormField(
              style: const TextStyle(
                height: 3,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.keyboard_voice_outlined),
                labelText: "password",
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 44.0, vertical: 2.0),
            child: Container(
              // padding: const EdgeInsets.only(right: 80.0),
              width: 600,
              height: 22,
              color: Colors.white,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const forgetpassword(),),);
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forget password?",
                      style: TextStyle(fontSize: 17.0, color: Colors.pink),
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
            height: 5,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Center(
            child: SizedBox(
              height: 60,
              width: 200,
              child: OutlinedButton(
                onPressed: () {
                login();
                },
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.white,
                  side: const BorderSide(width: 2.0, color: Colors.blue),
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.values.last,
                      children: const <Widget>[
                        Text('Login',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ],),
              ),
            ),
          ),
          Container(
            width: 1000,
            height: 12,
            color: Colors.white,
            child: const Center(),
          ),
          Container(
            width: 600,
            height: 20,
            color: Colors.white,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Don't have an account?  Sign Up",
                    style: TextStyle(fontSize: 17.0, color: Colors.purple),
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
