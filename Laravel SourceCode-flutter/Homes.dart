// ignore: file_names
// ignore_for_file: camel_case_types, dead_code, unused_label, prefer_const_constructors, file_names, duplicate_ignore, import_of_legacy_library_into_null_safe

import 'package:dicetutormobile/PostHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Homes extends StatefulWidget {
  const Homes({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Homes> {
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
            width: 500,
            height: 100,
            color: Colors.white,
            child: const Center(),
          ),
          //-----------------------------------------------------------------
          Center(
            child: Container(
              width: 300,
              height: 323,
              color: Colors.white,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 20.0),
                  child: const Image(
                    height: 200,
                    width: 200,
                    image: AssetImage('lib/mobile/Dice Tutuors.png'),
                    colorBlendMode: BlendMode.overlay,
                    fit: BoxFit.fill,
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

class sidenav extends StatelessWidget {
  const sidenav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Dicetutor',
                style: TextStyle(fontSize: 20, color: Colors.blue)),
          ),
          Padding(
              padding: EdgeInsets.all(20.0),
              child: FutureBuilder(
                future: FlutterSession().get('token'),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return Text(snapshot.hasData ? snapshot.data : 'loading...');
                },
              )),
          Divider(color: Colors.grey),
          // ignore: unnecessary_const
          ListTile(
            title: Text('UPDATE PROFILE'),
            leading: Icon(Icons.add_task),
            //focusColor: Colors.grey,
            //tileColor: Colors.grey,
            hoverColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostHome()),
              );
            },
          ),
          ListTile(
            title: Text('ADD SERVICE'),
            leading: Icon(Icons.person_add),
            hoverColor: Colors.red,
            onTap: () {},
          ),
          ListTile(
            title: Text('SERVICE REQUEST'),
            leading: Icon(Icons.add_business_sharp),
            hoverColor: Colors.red,
            selectedTileColor: Colors.blue,
            onTap: () {},
          ),
          ListTile(
            title: Text('LOG-OUT'),
            leading: Icon(Icons.logout),
            hoverColor: Colors.red,
            selectedTileColor: Colors.blue,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
