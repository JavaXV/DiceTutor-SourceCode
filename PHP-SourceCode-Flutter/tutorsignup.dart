
// ignore_for_file: camel_case_types, unnecessary_new, deprecated_member_use, avoid_unnecessary_containers, non_constant_identifier_names, import_of_legacy_library_into_null_safe, sized_box_for_whitespace, void_checks, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/tutorsignup1.dart';
import 'package:http/http.dart' as http;

class tutorsignup extends StatefulWidget {
  tutorsignup({Key? key}) : super(key: key);

  @override
  State<tutorsignup> createState() => _tutorsignupState();
}

class _tutorsignupState extends State<tutorsignup> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();

  Future registers(BuildContext cont) async {
    if (firstname.text == "" ||
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
    }  else {

      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tutorsignup1(email.text)));
      var Url = 'http://192.168.43.29/dicetutormobile/tutorAcc1.php';
      var response = await http.post(Uri.parse(Url), body: {
        "firstname": firstname.text,
        "lastname": lastname.text,
        "email": email.text,
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
      appBar: AppBar(
        title: const Text('Tutor'),
        foregroundColor: Colors.teal,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 1000,
            height: 23,
            color: Colors.white,
            child: const Center(),
          ),


       //------------------------------------------------
          Container(
            height: 71,
            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 2.0),
            child: TextFormField(
              style: const TextStyle(
                fontSize: 19.0,
                height: 2,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: firstname,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: "Firstname",
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          //--------------------------------------------
          Container(
            height: 71,
            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
            child: TextFormField(
              style: const TextStyle(
                fontSize: 19.0,
                height: 2,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: lastname,
              decoration: InputDecoration(
                labelText: "Lastname",
                prefixIcon: const Icon(Icons.person),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),

          Container(
            height: 72,
            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
            child: TextFormField(
              style: const TextStyle(
                fontSize: 19.0,
                height: 2,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: email,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                labelText: "Emailaddress",
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
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
            width: 199,
            height: 56,
            child: SizedBox(

              child: OutlinedButton(
                onPressed: () {
                  registers(context);
                },
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.white,
                  side: const BorderSide(width: 1.0, color: Colors.blue),
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.values.last,
                      children: const <Widget>[
                        Icon(
                          Icons.save_alt,
                          color: Colors.deepOrange,
                          size: 40.0,
                        ),
                        Text('Continue',
                          style: TextStyle(
                            fontSize: 25.0,
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
        ],
      ),
    );
  }
}
