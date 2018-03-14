import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> getData() async {
    var response;
    response = await http.get(
     // Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      Uri.encodeFull("http://192.168.1.2/json"),
      headers: {
        "Accept": "application/json"
      }
    );
    data = JSON.decode(response.body);
    //print(data[3]["title"]);
    //print(data[3]["body"]);
    print(data[3]["login"]);
    //print(data[3]["last_name"]);
    
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("Get data"),
          onPressed: getData,
        ),
      ),
    );
  }
}