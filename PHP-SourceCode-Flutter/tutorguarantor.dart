// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_string_interpolations, import_of_legacy_library_into_null_safe, non_constant_identifier_names, deprecated_member_use

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/tutoracademicdetails1.dart';
import 'package:untitled2/tutorsignin.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/tutorupdateprofile.dart';


class tutorguarantor extends StatefulWidget {
  late String email;
  tutorguarantor(this.email, {Key? key}) : super(key: key);

  // const tutorpersonaldetails2(String email, {Key? key}) : super(key: key);

  @override
  State<tutorguarantor> createState() => _tutorguarantorState();
}

class _tutorguarantorState extends State<tutorguarantor> {
  late String dropdownCity = 'Degree';
  var items =  ['Degree','-------------------------','DEGREE','-------------------------','B.Sc.','B.A.','B.Ed.','B.Eng','B.Tech.','Diploma.','MBBS','HND','OND','M.Sc.','LL.B','MBA','PhD',
    'N.C.E S.S.C.E'];


  TextEditingController email = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController gemail = TextEditingController();
  TextEditingController relationship = TextEditingController();

  @override
  void initState() {
    email = TextEditingController(text: "${widget.email}");
    super.initState();
  }

  Future editProfiles(BuildContext cont) async {
    if (relationship.text == "" ||
        gemail.text == "" ||
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

      var Url = 'http://192.168.43.29/dicetutormobile/tutorGuarantor.php';
      var response = await http.post(Uri.parse(Url), body: {
        "email": email.text,
        "gemail": gemail.text,
        "grelationship": relationship.text,
        "phoneno": phoneno.text,

      });
      var data = json.decode(response.body);
      if (data == "Success") {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tutoracademicdetails1(email.text)));
      } else {}

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            // icon: Icon(Icons.home),
             icon: Icon(
              Icons.home,
              color: Colors.purple,
              size: 25.0,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
              color: Colors.yellow,
              size: 25.0,
            ),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.yellowAccent,
                size: 25.0,
              ),
              title: Text('Profile')
          )
        ],
      ),

      body: Column(
        children: [
          Container(
            width: 1000,
            height: 37,
            color: Colors.black,
          ),
          Container(
            width: 1000,
            height: 32,
            color: Colors.white,

            child: const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 5.0),
              child: Text(
                "GUARANTOR INFORMATION",
                style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                textAlign: TextAlign.left,
              ),
            ),
          ),

          //--------------------------------------------
          Container(
            color: Colors.white,
            height:26,
            padding: const EdgeInsets.symmetric(
                horizontal: 25.0, vertical: 19.0),
            child: Visibility(
              visible: false,
              child: TextFormField(
                style: const TextStyle(
                  height:2,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
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
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 1000,
            height: 2,
            color: Colors.white,
          ),
          //----------------------------------------
          Container(
            color: Colors.white,
            height:78,
            padding: const EdgeInsets.symmetric(
                horizontal: 24.0, vertical: 2.0),
            child: Visibility(
              visible: true,
              child: TextFormField(
                style: const TextStyle(
                  height:3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
                controller: gemail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Guarantor-Email",
                  prefixIcon: const Icon(Icons.email),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          //--------------------------------------------
          Container(
            width: 1000,
            height: 3,
            color: Colors.white,
          ),
          //--------------------------------------------------

          Container(
            color: Colors.white,
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
                  color: Colors.deepOrange,
                ),
                controller: phoneno,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Guarantor:(Phone-No)",
                  prefixIcon: const Icon(Icons.email),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          //--------------------------------------------
          Container(
            width: 1000,
            height: 3,
            color: Colors.white,
          ),
          //--------------------------------------------------

          Container(
            color: Colors.white,
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
                  color: Colors.deepOrange,
                ),
                controller: relationship,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Relationship",
                  prefixIcon: const Icon(Icons.email),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 14,
            color: Colors.white,
          ),
          //-----------------------------------------------------------------

          //-----------------------------------------------------------------
          Center(
            child: SizedBox(
              height: 61,
              width: 200,
              child: OutlinedButton(
                onPressed: () {
                  editProfiles(context);
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
