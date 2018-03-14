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
      var response = await http.get(
        //Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        Uri.encodeFull("http://192.168.1.2/json"),
        headers: {
          "Accept": "application/json"
        }
      );

     //set state untuk data render atau listview
      this.setState((){
        data = JSON.decode(response.body);
      });
      
      print(data[1]["first_name"]);
      print(data[1]["last_name"]);
      
      return "Success!";
    }

    @override
    //function utk panggil dan render data on screen
    void initState() { 
      super.initState(); 
      this.getData();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List Views"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length, // if data == null ? and itemcount = 0 else(:) data.length
        itemBuilder: (BuildContext context, int index){
          return new Card(        // widget paparan
            child: new Column(
              children: <Widget>[
                new Text("Name : " +data[index]['first_name'] +"  " +data[index]["last_name"]),
           // new Text()
            
            //new Text(data[index]["body"]),

              ],
            ), 
            
          );
        }
      ),
    );
  }
}