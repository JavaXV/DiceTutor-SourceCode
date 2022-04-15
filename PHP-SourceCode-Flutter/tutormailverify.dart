// ignore_for_file: camel_case_types, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/tutorverifymessage.dart';

class tutormailverify extends StatefulWidget {
  const tutormailverify({Key? key}) : super(key: key);

  @override
  State<tutormailverify> createState() => _tutormailverifyState();
}

class _tutormailverifyState extends State<tutormailverify> {
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
      var url = 'http://192.168.43.29/dicetutormobile/digitverify.php';
      var response = await http.post(Uri.parse(url), body: {
        "digitvalue": digitvalue.text,
      });

      var data = json.decode(response.body);
      if (data == "Success") {
        debugPrint(data);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const tutorverifymessage()),
        );
      } else if (data == "Error") {
        debugPrint(data);
        Fluttertoast.showToast(
            msg: "Please your 4 digitNo is Incorrect ",
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 1000,
            height: 207,
            color: Colors.white,
            child: Center(
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
                height: 450,
                width: 300,
                child: const Image(
                  image: AssetImage('lib/mobile/page007.jpg'),
                  colorBlendMode: BlendMode.overlay,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            height:80,
            margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 2.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: const TextStyle(
                height: 2,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              controller: digitvalue,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.card_membership_rounded),
                labelText: "Verification-Code",
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Container(
            width: 1000,
            height: 85,
            color: Colors.white,
            child: const Center(),
          ),
          Center(
            child: SizedBox(
              height: 70,
              width: 200,
              child: OutlinedButton(
                onPressed: () {
                  confirmed();
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
