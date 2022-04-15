// ignore_for_file: camel_case_types, import_of_legacy_library_into_null_safe, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:untitled2/tutorpersonaldetails.dart';
import 'MyHomePage.dart';
import 'tutoraddservice.dart';
import 'tutorupdateprofile.dart';


class tutorhome extends StatefulWidget {
  const tutorhome({Key? key}) : super(key: key);

  @override
  State<tutorhome> createState() => _tutorhomeState();
}

class _tutorhomeState extends State<tutorhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Tutor')),
      drawer: const sidenav(),
      body: Column(
        children: [
          //-----------------------------------------------------------------
          Container(
            height: 110,
            color: Colors.white,
            child: const Center(

            ),
          ),
          //-----------------------------------------------------------------
          /*
          Container(
            width: 1000,
            height: 23,
            color: Colors.white,
            child: const Center(
              child: Text(
                "bringing tutor to your door step...",
                style: TextStyle(fontSize: 16.0, color: Colors.pink),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          */
          //-----------------------------------------------------------------
          Center(
            child: Container(
              height: 370,
              width: 350,
              color: Colors.white,
              child: const Center(
                  child: Image(
                    height: 350,
                    width: 350,
                    image: AssetImage('lib/mobile/page104.jpg'),
                    colorBlendMode: BlendMode.overlay,
                    fit: BoxFit.fill,

                  ),

              ),
            ),
          ),

        ],
      ),
    );
  }
}

class sidenav extends StatelessWidget {
  const sidenav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Image(
              height: 80,
              width: 80,
              image: AssetImage('lib/mobile/Dice Tutuors.png'),
              colorBlendMode: BlendMode.overlay,
              fit: BoxFit.contain,
            )
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Center(
                child: FutureBuilder(
                  future: FlutterSession().get('token'),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      return Text(snapshot.hasData ? snapshot.data : 'loading...');
                  },),
              ),
             ),

          const Divider(color: Colors.grey),
          // ignore: unnecessary_const
          ListTile(
            title: const Text('UPDATE PROFILE'),
            leading: const Icon(Icons.add_task),
            focusColor: Colors.blueAccent,
            tileColor: Colors.purpleAccent,
            hoverColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const tutorpersonaldetails()),
              );
            },
          ),
          ListTile(
            title: const Text('ADD SERVICE'),
            leading: const Icon(Icons.person_add),
            hoverColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const tutoraddservice()),
              );
            },
          ),
          ListTile(
            title: const Text('SERVICE REQUEST'),
            leading: const Icon(Icons.add_business_sharp),
            hoverColor: Colors.red,
            selectedTileColor: Colors.blue,
            onTap: () {},
          ),
          ListTile(
            title: const Text('EDIT PROFILE'),
            leading: const Icon(Icons.add_business_sharp),
            hoverColor: Colors.red,
            selectedTileColor: Colors.blue,
            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const tutorupdateprofile()),
            );},
          ),
          ListTile(
            title: const Text('LOG-OUT'),
            leading: const Icon(Icons.logout),
            hoverColor: Colors.red,
            selectedTileColor: Colors.blue,
            onTap: () {
              FlutterSession().set('token', '');
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          )
        ],
      ),
    );
  }
}
