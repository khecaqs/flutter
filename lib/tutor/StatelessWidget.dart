import 'package:flutter/material.dart';



void main() {
  runApp(new MaterialApp(
    home: new MyStatelessWidget()
  ));
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Stateless Widget")),
      body: new Container(
        padding: new EdgeInsets.all(20.0), //jarak frame dgn border kotak 
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Mycard(
              title: new Text("I love Flutter",
                style: new TextStyle(
                  fontSize: 25.0
                  )
                ),
              icon: new Icon(Icons.favorite, size: 40.0, color: Colors.redAccent)
            ),
            new Mycard(
              title: new Text("I Love Donuts",
               style: new TextStyle(
                  fontSize: 25.0
                  )
              ),
              icon: new Icon(Icons.donut_large, size: 40.0, color: Colors.brown)
            ),
            new Mycard(
              title: new Text("I See You",
               style: new TextStyle(
                  fontSize: 25.0
                  )
              ),
              icon: new Icon(Icons.visibility, size: 40.0, color: Colors.blue),
            )
          ]
        )
      )
    );
  }
}

class Mycard extends StatelessWidget {
  Mycard({this.title, this.icon});

  final Widget title;
  final Widget icon;

  @override
  
  Widget build(BuildContext context){
    return new Container(
      padding: new EdgeInsets.only(bottom: 20.0), // jarak anatar box
      child: new Card(
        child: new Container( 
          padding: new EdgeInsets.all(10.0), // jarak border dgn text
          child: new Column(
            children: <Widget>[
            this.title,
            this.icon
            ],
          ),
        ),
      ),
    );
  }
}