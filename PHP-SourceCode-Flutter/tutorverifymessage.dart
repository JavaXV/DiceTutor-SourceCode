// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/tutorsignin.dart';

class tutorverifymessage extends StatefulWidget {
  const tutorverifymessage({Key? key}) : super(key: key);

  @override
  State<tutorverifymessage> createState() => _tutorverifymessageState();
}

class _tutorverifymessageState extends State<tutorverifymessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 315,
            color: Colors.white,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 4.0, vertical: 4.0),
                height: 500,
                width: 250,
                child: const Image(
                  image: AssetImage('lib/mobile/page008.jpg'),
                  colorBlendMode: BlendMode.overlay,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            width: 1000,
            height: 155,
            color: Colors.white,
            child: const Center(),
          ),
          Center(
            child: SizedBox(
              height: 80,
              width: 210,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const tutorsignin()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.white,
                  side: const BorderSide(width: 3.0, color: Colors.blue),
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
