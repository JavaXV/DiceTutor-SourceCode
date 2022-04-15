
// ignore_for_file: camel_case_types, deprecated_member_use

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'MyHomePage.dart';

class textfielfd extends StatefulWidget {
  const textfielfd({Key? key}) : super(key: key);

  @override
  State<textfielfd> createState() => _textfielfdState();
}

class _textfielfdState extends State<textfielfd> {
  TextEditingController digitvalue = TextEditingController();

  Future getContactData() async {
    var url = 'http://192.168.43.29/dicetutormobile/getData.php';
    var response = await http.post(Uri.parse(url), body: {
      "digitvalue": digitvalue.text,
    });
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign-Up'),
      ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  const [

              ],
          ),
        ),
      ),
    );
  }
}
