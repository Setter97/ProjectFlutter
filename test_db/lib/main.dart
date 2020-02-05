import 'package:flutter/material.dart';
import 'package:test_db/firebaseDB/newItem.dart';
import 'firebaseDB/newLab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Firebase Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: <Widget>[
          RaisedButton(
            /*
            onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>newLab()));
            },*/
            child: Text("Añadir laboratorio"),
          ),

          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>newItem()));
            },
            child: Text("Añadir item a laboratorio"),
          ),
        ],),
      ),
    );
  }
}
