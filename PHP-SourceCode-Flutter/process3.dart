// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/process2.dart';
import 'package:untitled2/tutorsignup.dart';

class process3 extends StatefulWidget {
  const process3({Key? key}) : super(key: key);

  @override
  State<process3> createState() => _process3State();
}

class _process3State extends State<process3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.teal,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 500,
            height: 125,
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 45.0),
              child: Text(
                "Let's get started",
                style: TextStyle(fontSize: 25.0, color: Colors.blue, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,

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
              height: 70,
              width: 320,
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
                    side: const BorderSide(width: 1.2, color: Colors.blue),
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
                          Text('Tutors',
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
            height: 30,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------

          Center(
            child: SizedBox(
              height: 70,
              width: 320,
              child: Container(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const process2()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                   // shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 1.2, color: Colors.blue),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Text('Guardians/Student',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
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
            height: 30,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Center(
            child: SizedBox(
              height: 70,
              width: 320,
              child: Container(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const process2()),
                    );
                  },
                    style: OutlinedButton.styleFrom(
                  //  shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                      side: const BorderSide(width: 1.2, color: Colors.blue),
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
                      Text('School',
                        style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
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
