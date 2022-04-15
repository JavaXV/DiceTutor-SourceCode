// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_string_interpolations, import_of_legacy_library_into_null_safe, non_constant_identifier_names, deprecated_member_use

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/tutoracademicdetails1.dart';
import 'package:untitled2/tutorsignin.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/tutorupdateprofile.dart';


class tutoracademicdetails extends StatefulWidget {
  late String email;
  tutoracademicdetails(this.email, {Key? key}) : super(key: key);

  // const tutorpersonaldetails2(String email, {Key? key}) : super(key: key);

  @override
  State<tutoracademicdetails> createState() => _tutoracademicdetailsState();
}

class _tutoracademicdetailsState extends State<tutoracademicdetails> {
  late String dropdownCity = 'Degree';
  var items =  ['Degree','-------------------------','DEGREE','-------------------------','B.Sc.','B.A.','B.Ed.','B.Eng','B.Tech.','Diploma.','MBBS','HND','OND','M.Sc.','LL.B','MBA','PhD',
    'N.C.E S.S.C.E'];


  TextEditingController email = TextEditingController();
  TextEditingController course = TextEditingController();
  TextEditingController school = TextEditingController();


  @override
  void initState() {
    email = TextEditingController(text: "${widget.email}");
    super.initState();
  }

  Future editProfile1(BuildContext cont) async {
    if (dropdownCity == "" ||
        course.text == "" ||
        school.text == "" ||
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

      var Url = 'http://192.168.43.29/dicetutormobile/tutorEdit3.php';
      var response = await http.post(Uri.parse(Url), body: {
        "email": email.text,
        "degree": dropdownCity,
        "school": school.text,
        "course": course.text,

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
            color: Colors.white,
          ),
          Container(
            width: 1000,
            height: 32,
            color: Colors.white,

            child: const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 5.0),
              child: Text(
                "ACADEMIC INFORMATION",
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
                textAlign: TextAlign.left,
              ),
            ),
          ),

          //--------------------------------------------
          Container(
            color: Colors.white,
            height:26,
            padding: const EdgeInsets.symmetric(
                horizontal: 25.0, vertical: 2.0),
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
                controller: school,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Name-Of-School",
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
                controller: course,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Course-Of-Study",
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
            height:79,
            padding: const EdgeInsets.symmetric(
                horizontal: 25.0, vertical: 2.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:75,
                    padding: EdgeInsets.symmetric(
                        horizontal: 44.0, vertical: 3),

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 1.0),
                      borderRadius: BorderRadius.circular(3.0),
                    ),

                    child: DropdownButton<String>(
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),

                      isExpanded: true,
                      items: items.map((itemsnameG){
                        return DropdownMenuItem(
                            value: itemsnameG,
                            child: Text(itemsnameG)
                        );
                      }).toList(),
                      onChanged: (newValue) => setState(() => dropdownCity = newValue as String),
                      value: dropdownCity,
                    ),

                  )

                ],
              ),
            ),
          ),

          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 17,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Center(
            child: SizedBox(
              height: 61,
              width: 200,
              child: OutlinedButton(
                onPressed: () {
                  editProfile1(context);
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
