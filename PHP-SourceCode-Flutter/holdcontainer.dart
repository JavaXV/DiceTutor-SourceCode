
// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, avoid_print, unnecessary_new, must_be_immutable, unnecessary_null_comparison, avoid_unnecessary_containers, dead_code

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';

class holdcontainer extends StatefulWidget {
  const holdcontainer({Key? key}) : super(key: key);

  @override
  State<holdcontainer> createState() => _holdcontainerState();
}

class _holdcontainerState extends State<holdcontainer> {
  TextEditingController digitvalue = TextEditingController();


  Future<List>getData() async {
    var Url = 'http://192.168.43.29/dicetutormobile/getData.php';
    var response = await http.get(Uri.parse(Url));
    return json.decode(response.body);
  }


/*
  Future getContactData() async {
    var url = 'http://192.168.43.29/dicetutormobile/getData.php';
    var response = await http.post(Uri.parse(url), body: {
      "digitvalue": digitvalue.text,
    });
    return json.decode(response.body);
  }
  */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Back'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {

  List list;
  ItemList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
        itemCount: list==null ? 0 : list.length,
        itemBuilder: (context, i){
          return new Container(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: new OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => detail(list:list, index: i,)),
                );
              },
              child: new Card(
                child: new ListTile(
                  title: new Text(list[i]['email']),
                  leading: new Icon(Icons.widgets),
                  subtitle: new Text("Unique-id: ${list[i]['code']}"),

                ),
              ),

            )
          );

        },
    );
  }
}

