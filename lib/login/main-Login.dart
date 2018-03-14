import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
       theme: new ThemeData(
       primarySwatch: Colors.blue
     ),
     home: new LoginPage(),
    
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.deepPurple,
      body: new Stack(
        //fit: StackFit.expand,
        //fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/logoUMT.png"),
            fit: BoxFit.cover,
            //color: Colors.deepPurple,
            colorBlendMode: BlendMode.softLight,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Image(
                image: new AssetImage("assets/Nemo.png"),
                height: 100.0,
                width: 100.0
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal, fontSize: 20.0))),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                        hintText: "ID",
                      ),
                      keyboardType: TextInputType.text,
                    ),
                     new TextFormField(
                      decoration: new InputDecoration(
                        hintText: "Katalaluan",
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    new MaterialButton(
                      height: 40.0,
                      minWidth: 100.0,
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text("login"),
                      onPressed: () => {},
                      splashColor: Colors.redAccent,
                      ),
                  ],
                   ),
                )
                )
              )
            ],
          )
        ],
      ),
    );
  }
}