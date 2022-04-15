// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/process3.dart';

class process2 extends StatefulWidget {
  const process2({Key? key}) : super(key: key);

  @override
  State<process2> createState() => _process2State();
}

class _process2State extends State<process2> {
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
            child: const Center(),
          ),
          Container(
            width: 1000,
            height: 370,
            color: Colors.white,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 10.0),
                height: 700,
                width: 400,
                child: const Image(
                  image: AssetImage('lib/mobile/page04.jpg'),
                  colorBlendMode: BlendMode.overlay,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 110,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 10,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Container(
            width: 1000,
            height: 50,
            color: Colors.white60,
            child: Center(
              child: SizedBox(
                height: 50,
                width: 250,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const process3()),
                    );
                  },
                  child: const Text('Continue',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.blueAccent,
                  ),

                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
