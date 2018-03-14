/* import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';


void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State createState() => new HomeState();
}

class HomeState extends State<Home> {
  
  TextEditingController keyInputController = new TextEditingController();
  TextEditingController valueInputController = new TextEditingController();

  File jsonFile;
  Directory dir;
  final String fileName = "mFile.json";
  bool fileExists = false;
  String fileContent = " Reading file ..";
  
  void initState() {
      // TODO: implement initState
      super.initState();
      getApplicationDocumentsDirectory().then((Directory dir){
        
      });
    }
    
  @override
  void dispose() {
    keyInputController.dispose();
    valueInputController.dispose();
    super.dispose();
  }

  File createFile(Map<String, String> content) {

  }

  void writeToFile(String key, String value) {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("JSON Tutorial")),
      body: new Column(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 10.0)),
          new Text("File content: ", style: new TextStyle(fontWeight: FontWeight.bold)),
          new Text("PLACEHOLDER FOR FILE CONTENT"),
          new Padding(padding: new EdgeInsets.only(top: 10.0)),
          new Text("Add to JSON file: "),
          new TextField(
            controller: keyInputController,
          ),
          new TextField(
            controller: valueInputController,
          ),
          new Padding(padding: new EdgeInsets.only(top: 20.0)),
          new RaisedButton(
            child: new Text("Add Key, Value pair"),
            onPressed: () => null,
            )
        ],
      ),
    );
  }
  
  } */