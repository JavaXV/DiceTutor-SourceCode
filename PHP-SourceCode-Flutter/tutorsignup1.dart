
// ignore_for_file: camel_case_types, unnecessary_new, deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations, import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/tutormailnotice.dart';
import 'package:http/http.dart' as http;


class tutorsignup1 extends StatefulWidget {
  late String email;
  tutorsignup1(this.email);
 // tutorsignup1(String text, {Key? key}) : super(key: key);


  @override
  State<tutorsignup1> createState() => _tutorsignupState();
}

class _tutorsignupState extends State<tutorsignup1> {

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();


  @override
  void initState() {
    email = TextEditingController(text: "${widget.email}");
    super.initState();
  }

  Future register(BuildContext cont) async {
    if (pass.text == "" ||
        cpass.text == "" ||
        email.text == "") {
      Fluttertoast.showToast(
          msg: "Please all field are required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
       } else if(pass.text != cpass.text) {
      Fluttertoast.showToast(
        msg: "Please password must Match",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    }else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const tutormailnotice()),
      );

      var Url = 'http://192.168.43.29/dicetutormobile/tutorAcc2.php';
      var response = await http.post(Uri.parse(Url), body: {
        "password": pass.text,
        "cpassword": cpass.text,
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

            height: 23,
            color: Colors.white,
            child: const Center(),
          ),
           //-----------------------------------------------
          Container(
            height: 71,
            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
            child: TextFormField(
              style: const TextStyle(
                fontSize: 20.0,
                height: 2,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: email,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: "EmailAddress",
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
          //------------------------------------------------

          Container(
            height: 71,
            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 3.0),
            child: TextFormField(
              style: const TextStyle(
                fontSize: 21.0,
                height: 2,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: pass,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: "Password",
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
                fontSize: 21.0,
                height: 2,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: cpass,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: "ConfirmedPassword",
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
            height: 11,
            color: Colors.white,
            child: const Center(),
          ),
          Container(
            width: 199,
            height: 56,
            child: SizedBox(

              child: OutlinedButton(
                onPressed: () {
                 register(context);
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
