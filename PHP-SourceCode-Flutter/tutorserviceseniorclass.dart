// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, import_of_legacy_library_into_null_safe, deprecated_member_use

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/tutorpersonaldetails2.dart';
import 'package:untitled2/tutorserviceseniorclass1.dart';


class tutorserviceseniorclass extends StatefulWidget {
  const tutorserviceseniorclass({Key? key}) : super(key: key);

  @override
  State<tutorserviceseniorclass> createState() => _tutorserviceseniorclassState();
}

class _tutorserviceseniorclassState extends State<tutorserviceseniorclass> {

  late String dropdownCity = 'Subject';
  var items =  ['Subject','-------------------------','SENIOR SCHOOL','-------------------------','ENGLISH LANGUAGE','FURTHER MATHEMATIC','TECHNICAL DRAWING','MATHEMATIC','BIOLOGY','CHEMISTRY','PHYSICS','AGRIC SCIENCE','GEOGRAPHY','ECONOMICS','CIVIC EDUCATION','CATERING CRAFT','YORUBA LANGUAGE',
    'IGBO LANGUAGE','FOOD AND NUTRITION','COMMERCE','ACCOUNTING','GOVERNMENT','CHRISTIAN-RK','MUSLIM-RK','LITERATURE'];

  TextEditingController email = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController dates = TextEditingController();


  Future editProfile(BuildContext cont) async {
    if (dates.text == "" ||
        price.text == "" ||
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

      var Url = 'http://192.168.43.29/dicetutormobile/addService.php';
      var response = await http.post(Uri.parse(Url), body: {
        "subject": dropdownCity,
        "price": price.text,
        "email": email.text,
      });
      var data = json.decode(response.body);
      if (data == "Success") {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tutorserviceseniorclass1(email.text)));
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
        items: const [
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
      appBar: AppBar(
        foregroundColor: Colors.teal,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [

          Container(
            width: 1000,
            height: 38,
            color: Colors.white,

            child: const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 25.0, vertical: 5.0),
              child: Text(
                "Add Service[Senior-Class]",
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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Unique-ID",
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
              controller: price,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.keyboard_voice_outlined),
                labelText: "Price/Hr",
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
                      borderRadius: BorderRadius.circular(9.0),
                    ),

                    child: DropdownButton<String>(
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tutorserviceseniorclass1(email.text)));
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
