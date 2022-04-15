// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/tutorpersonaldetails2.dart';


class tutorpersonaldetails extends StatefulWidget {
  const tutorpersonaldetails({Key? key}) : super(key: key);

  @override
  State<tutorpersonaldetails> createState() => _tutorpersonaldetailsState();
}

class _tutorpersonaldetailsState extends State<tutorpersonaldetails> {
  TextEditingController email = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController dates = TextEditingController();


  Future editProfile(BuildContext cont) async {
    if (dates.text == "" ||
        phoneno.text == "" ||
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

      var Url = 'http://192.168.43.29/dicetutormobile/tutorEdit.php';
      var response = await http.post(Uri.parse(Url), body: {
        "dob_day": dates.text,
        "number1": phoneno.text,
        "email": email.text,
      });
      var data = json.decode(response.body);
      if (data == "Success") {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tutorpersonaldetails2(email.text)));
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
            height: 40,
            color: Colors.white,
          ),
          Container(
            width: 1000,
            height: 38,
            color: Colors.white,

            child: const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 5.0),
              child: Text(
                "PERSONAL INFORMATION",
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
                textAlign: TextAlign.left,
              ),
            ),
          ),

          Container(
            width: 1000,
            height: 20,
            color: Colors.white,
          ),
          //--------------------------------------------
          Container(
            color: Colors.white,
            height:70,
            padding: const EdgeInsets.symmetric(
                horizontal: 25.0, vertical: 2.0),
            child: TextFormField(
              style: const TextStyle(
                height:2,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              controller: email,
              decoration: InputDecoration(
                labelText: "Email-Address",
                prefixIcon: const Icon(Icons.email),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Container(
            width: 1000,
            height: 4,
            color: Colors.white,
          ),
          Container(
            height:80,
            padding: const EdgeInsets.symmetric(
                horizontal: 25.0, vertical: 2.0),
            child: TextFormField(
              style: const TextStyle(
                height:3,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              keyboardType: TextInputType.number,
              controller: phoneno,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.keyboard_voice_outlined),
                labelText: "Phone-No",
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Container(
            height: 6,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Container(
            height:80,
            padding: const EdgeInsets.symmetric(
                horizontal: 25.0, vertical: 2.0),
            child: Visibility(
              visible: true,
            child: TextFormField(
              style: const TextStyle(
                height:3,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              keyboardType: TextInputType.datetime,
              controller: dates,
              decoration: InputDecoration(
                labelText: "DateOfBirth(year-month-day)",
                  prefixIcon: const Icon(Icons.tv_off_outlined),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            ),
          ),
          //-----------------------------------------------------------------


          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 12,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Center(
            child: SizedBox(
              height: 62,
              width: 200,
              child: OutlinedButton(
                onPressed: () {
                 editProfile(context);
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
                        Text('Next',
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

        ],
      ),
    );
  }
}
