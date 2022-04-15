// ignore_for_file: camel_case_types, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/tutoracademicdetails.dart';
import 'package:untitled2/tutorpersonaldetails.dart';
import 'package:untitled2/tutorsignup.dart';

class tutorupdateprofile extends StatefulWidget {
  const tutorupdateprofile({Key? key}) : super(key: key);

  @override
  State<tutorupdateprofile> createState() => _tutorupdateprofileState();
}

class _tutorupdateprofileState extends State<tutorupdateprofile> {
  late String email;
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
      appBar: AppBar(title: const Text('Tutor')),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 120,
            color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 41.0, vertical: 45.0),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 25.0, color: Colors.blue, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,

                ),
              ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 10,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Center(
            child: SizedBox(
              height: 60,
              width: 270,
              child: Container(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const tutorpersonaldetails()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    // shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 1.1, color: Colors.blue),
                  ),

                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[

                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black45,
                        size: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.values.first,
                        children: const <Widget>[
                          Text('Personal Information',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ],
                      ),
                    ],),
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 20,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------

          Center(
            child: SizedBox(
              height: 60,
              width: 270,
              child: Container(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tutoracademicdetails(email)),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    // shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 1.1, color: Colors.blue),
                  ),

                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[

                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black45,
                        size: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.values.first,
                        children: const <Widget>[
                          Text('Academic Information',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ],
                      ),
                    ],),
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 20,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Center(
            child: SizedBox(
              height: 60,
              width: 270,
              child: Container(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tutorsignup()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    // shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 1.1, color: Colors.blue),
                  ),

                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[

                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black45,
                        size: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.values.first,
                        children: const <Widget>[
                          Text("Guarantor's Information",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ],
                      ),
                    ],),
                ),
              ),
            ),
          ),
          //--------------------------------------------------------
          Container(
            width: 1000,
            height: 20,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Center(
            child: SizedBox(
              height: 60,
              width: 270,
              child: Container(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tutorsignup()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    // shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 1.1, color: Colors.blue),
                  ),

                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[

                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black45,
                        size: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.values.first,
                        children: const <Widget>[
                          Text('Image Upload',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ],
                      ),
                    ],),
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 20,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Center(
            child: SizedBox(
              height: 60,
              width: 270,
              child: Container(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tutorsignup()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    // shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 1.1, color: Colors.blue),
                  ),

                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[

                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black45,
                        size: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.values.first,
                        children: const <Widget>[
                          Text('Bank Information',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ],
                      ),
                    ],),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
