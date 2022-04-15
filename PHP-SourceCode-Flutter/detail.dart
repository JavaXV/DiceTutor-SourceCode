// ignore_for_file: camel_case_types, unnecessary_new, must_be_immutable, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class detail extends StatefulWidget {
  List list;
  int index;
  detail({Key? key, required this.index, required this.list}) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['degree']}")),
      body: new Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: new Card(
          child: new Center(
            child: Column(
              children: [
                new Text(widget.list[widget.index]['firstname'],style: const TextStyle(fontSize: 20.0),), Text(widget.list[widget.index]['lastname'],style: const TextStyle(fontSize: 20.0),),
                new Text("School: ${widget.list[widget.index]['school']}",style: const TextStyle(fontSize: 18.0),),
                new Text("Unique-ID: ${widget.list[widget.index]['code']}",style: const TextStyle(fontSize: 18.0),),
                new Text("Course: ${widget.list[widget.index]['course']}",style: const TextStyle(fontSize: 18.0),),
                const Padding(padding: EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new RaisedButton(
                    child: const Text("Edit"),
                    color: Colors.purpleAccent,
                    onPressed: (){},
                    ),
                    new RaisedButton(
                      child: const Text("Delete"),
                      color: Colors.blueAccent,
                      onPressed: (){},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
