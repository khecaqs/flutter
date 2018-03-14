import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
_HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("App Drawer"), backgroundColor: Colors.redAccent,),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Mohammad Asha'ari Mustafa"),
              accountEmail: new Text("mam@gmail.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () => print("This is current User"),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage("https://https://i1.wp.com/pptm.umt.edu.my/wp-content/uploads/sites/21/2016/01/pokmung-e1453279032916.jpg"),
                ),
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage("http://www.cameronhighland.net/img/gunung-irau-brinchang.jpg"),
                )
              ),
            ),
            new ListTile(
              title: new Text("Fist"),
              trailing: new Icon(Icons.arrow_upward),
            ),
            new ListTile(
              title: new Text("Second"),
              trailing: new Icon(Icons.arrow_right),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.cancel),
            )
          ],
        ),
      ),
      body: new Center(
        child: new Text("Home Page", style: new TextStyle(fontSize: 35.0),),
      ),
    );
  }
}