import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

enum ResultStatus {
  success,
  failure,
  loading,
}

class HomePageState extends State<HomePage> {

  List data;

  var url = "http://flutapi.epizy.com/api/get_all_products.php/?pid=1";
 // var url = "https://jsonplaceholder.typicode.com/posts";

/*   Future<String> getData() async {
    var response;
    response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Accept": "application/json"
      }
    );
    data = JSON.decode(response.body);
    //print(data);
    
    //print(data[3]["title"]);
    //print(data[3]["body"]);
    print(data[1]["name"]);
    //print(data[3]["last_name"]);
    
    return "Success!";
  } */


 Future<String> getData(int id) async {
   ResultStatus _status;


   setState(() {
      _status = ResultStatus.loading;
    });

    var response;
    response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Accept": "application/json"
      }
    );
    data = JSON.decode(response.body);
    //print(data);
    
    //print(data[3]["title"]);
    //print(data[3]["body"]);
    print(data[1]["name"]);
    //print(data[3]["last_name"]);
    
    return "Success!";
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("Get data"),
          onPressed: () => getData(1),
        ),
      ),
    );
  }
}