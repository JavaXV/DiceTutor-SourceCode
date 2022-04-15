
// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/tutorsignin.dart';
import 'package:untitled2/process2.dart';
import 'package:untitled2/textfield.dart';
import 'package:untitled2/tutorhome.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Column(
       children: [
         Container(
           width: 1000,
           height: 300,
           color: Colors.white,
           child: Center(
             child: Container(
               padding: const EdgeInsets.symmetric(
                   horizontal: 50.0, vertical: 70.0),
               child: const Image(
                 image: AssetImage('lib/mobile/Dice Tutuors.png'),
                 colorBlendMode: BlendMode.overlay,
                 fit: BoxFit.fill,
               ),
             ),
           ),
         ),
         //-----------------------------------------------------------------
         Container(
           width: 1000,
           height: 136,
           color: Colors.white,
           child: const Center(),
         ),
         //-----------------------------------------------------------------
         Container(
           width: 1000,
           height: 70,
           color: Colors.white,
           child: Center(
             child: SizedBox(
               height: 100,
               width: 270,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const process2()),
                    );
                  },
                  child: const Text('Get Started',
                    style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
         //-----------------------------------------------------------------
         Container(
           width: 1000,
           height: 15,
           color: Colors.white,
           child: const Center(),
         ),
         //
         Container(
           width: 1000,
           height: 70,
           color: Colors.white60,
           child: Center(
             child: SizedBox(
               height: 100,
               width: 270,
               child: OutlinedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const tutorsignin()),
                   );
                 },
                 child: const Text('Sign In',
                   style: TextStyle(
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold,
                     color: Colors.yellowAccent,
                   ),
                 ),
                 style: OutlinedButton.styleFrom(
                   shape: const StadiumBorder(),
                   backgroundColor: Colors.grey,
                 ),

               ),
             ),
           ),
         )
       ],
     ),
    );
  }
}
