// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:untitled2/process2.dart';
import 'package:untitled2/tutormailverify.dart';

class tutormailnotice extends StatefulWidget {
  const tutormailnotice({Key? key}) : super(key: key);

  @override
  State<tutormailnotice> createState() => _tutormailnoticeState();
}

class _tutormailnoticeState extends State<tutormailnotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Container(
              color: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 34.0),
                height: 400,
                width: 320,
                child: const Image(
                  image: AssetImage('lib/mobile/page006.jpg'),
                  colorBlendMode: BlendMode.overlay,
                  fit: BoxFit.fill,
                ),
            ),
          ),
          Container(
            width: 1000,
            height: 140,
            color: Colors.white,
            child: const Center(),
          ),
          Container(
            color: Colors.white,
            child: Center(
              child: SizedBox(
                height: 80,
                width: 210,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const tutormailverify()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 5.0, color: Colors.blue),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.values.last,
                        children: const <Widget>[
                          Text('Continue',
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
          ),


        ],
      ),
    );
  }
}
