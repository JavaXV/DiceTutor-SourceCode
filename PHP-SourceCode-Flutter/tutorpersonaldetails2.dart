// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_string_interpolations, import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/tutorpersonaldetails3.dart';
import 'package:untitled2/tutorsignin.dart';
import 'package:http/http.dart' as http;


class tutorpersonaldetails2 extends StatefulWidget {
  late String email;
  tutorpersonaldetails2(this.email, {Key? key}) : super(key: key);

 // const tutorpersonaldetails2(String email, {Key? key}) : super(key: key);

  @override
  State<tutorpersonaldetails2> createState() => _tutorpersonaldetails2State();
}

class _tutorpersonaldetails2State extends State<tutorpersonaldetails2> {
  late String dropdownvalue = 'State Of Origin';
  var items =  ['State Of Origin','Abia','Adamawa','Akwa Ibom','Anambra','Bauchi','Bayelsa','Benue','Borno','Cross River','Delta','Ebonyi','Edo','Ekiti','Enugu',
  'Gombe','Imo','Jigawa','Kaduna','Kano','Kastina','Kebbi','Kogi','Kwara','Lagos','Nasarawa','Niger','Ogun','Ondo','Osun','Oyo','Plateau','Rivers','Sokoto','Taraba','Yobe','Zamfara'];

  late String dropdownvalues = 'State Of Resident';
  var itemss =  ['State Of Resident','Abia','Adamawa','Akwa Ibom','Anambra','Bauchi','Bayelsa','Benue','Borno','Cross River','Delta','Ebonyi','Edo','Ekiti','Enugu',
    'Gombe','Imo','Jigawa','Kaduna','Kano','Kastina','Kebbi','Kogi','Kwara','Lagos','Nasarawa','Niger','Ogun','Ondo','Osun','Oyo','Plateau','Rivers','Sokoto','Taraba','Yobe','Zamfara'];

  late String dropdownGender = 'Select Gender';
  var itemsss =  ['Select Gender','Male','Female'];


  TextEditingController email = TextEditingController();
  TextEditingController dropdownValue = TextEditingController();
  TextEditingController state = TextEditingController();


  @override
  void initState() {
    email = TextEditingController(text: "${widget.email}");
    super.initState();
  }

  Future editProfile1(BuildContext cont) async {
    if (dropdownvalue == "" ||
        dropdownvalues == "" ||
        dropdownGender == "" ||
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

      var Url = 'http://192.168.43.29/dicetutormobile/tutorEdit1.php';
      var response = await http.post(Uri.parse(Url), body: {
        "email": email.text,
        "vicinity": dropdownvalue,
        "state": dropdownvalues,
        "gender": dropdownGender,
      });
      var data = json.decode(response.body);
      if (data == "Success") {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tutorpersonaldetails3(email.text)));
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
                    borderRadius: BorderRadius.circular(13.0),
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
                      borderRadius: BorderRadius.circular(4.0),
                    ),

                    child: DropdownButton<String>(
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),

                      isExpanded: true,
                      items: itemsss.map((itemsnameG){
                        return DropdownMenuItem(
                            value: itemsnameG,
                            child: Text(itemsnameG)
                        );
                      }).toList(),
                      onChanged: (newValue) => setState(() => dropdownGender = newValue as String),
                      value: dropdownGender,
                    ),

                  )

                ],
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
                    items: items.map((itemsname){
                      return DropdownMenuItem(
                          value: itemsname,
                          child: Text(itemsname)
                      );
                    }).toList(),
                  onChanged: (newValue) => setState(() => dropdownvalue = newValue as String),
                  value: dropdownvalue,
              ),

                )

            ],
          ),
        ),
      ),

          Container(
            height: 7,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------

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
                      items: itemss.map((itemsnames){
                        return DropdownMenuItem(
                            value: itemsnames,
                            child: Text(itemsnames)
                        );
                      }).toList(),
                      onChanged: (newValues) => setState(() => dropdownvalues = newValues as String),
                      value: dropdownvalues,
                    ),

                  )

                ],
              ),
            ),
          ),

          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 40,
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
