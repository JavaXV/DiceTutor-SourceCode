// ignore_for_file: file_names, avoid_unnecessary_containers, must_call_super, import_of_legacy_library_into_null_safe, deprecated_member_use
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Homes.dart';
import 'api.dart';

class PostHome extends StatefulWidget {
  const PostHome({Key? key}) : super(key: key);

  @override
  State<PostHome> createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {
  late TextEditingController email;
  late TextEditingController birth;
  late TextEditingController address;
  late TextEditingController state;

  Future tutorupdate() async {
    var data = {
      "email": email.text,
      "birth": birth.text,
      "address": address.text,
      "state": state.text,
    };
    var res = await TutorUpdateApi().postData(data, 'updateprofile');
    var body = json.decode(res.body);
    if (body['Success']) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Homes()),
      );
    } else {
      Fluttertoast.showToast(
          msg: "Please all field are required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Container(
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email-Address',
                  hintText: 'Enter Email',
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Container(
              child: TextField(
                controller: address,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                  hintText: 'Enter HomeAddress',
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Container(
              child: TextField(
                controller: state,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'StateOfOrigin',
                  hintText: 'Enter State',
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Container(
              child: TextField(
                controller: birth,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'DateOfBirth',
                  hintText: 'Enter DOB',
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(25),
          child: FlatButton(
            child: const Text(
              'Update-Profile',
              style: TextStyle(fontSize: 20.0),
            ),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              tutorupdate();
            },
          ),
        ),
        Center(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder(
                future: FlutterSession().get('token'),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return Text(snapshot.hasData ? snapshot.data : 'loading...');
                },
              )),
        )
      ]),
    );
  }

  @override
  void initState() {
    email = TextEditingController();
    birth = TextEditingController();
    state = TextEditingController();
    address = TextEditingController();
  }
}
