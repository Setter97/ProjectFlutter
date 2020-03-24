import 'package:flutter/material.dart';
import 'package:test_db/firebaseDB/mostraItems.dart';
import 'package:test_db/firebaseDB/mostraLabs.dart';
import 'package:test_db/firebaseDB/newItem.dart';
import 'firebaseDB/newLab.dart';

//void main() => runApp(MyApp());


void main() {
  runApp(MaterialApp(
    title: 'asdhgksh',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => MyApp(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/firebaseDB/newLab': (context) => newLab(),
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Firebase Demo Lab App'),
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
            
            onPressed: (){
             Navigator.pushNamed(context, "/añadirLab");
            },
            child: Text("Añadir laboratorio"),
          ),

          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>newItem()));
            },
            child: Text("Añadir item a laboratorio"),
          ),


           RaisedButton(
            
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MostraLabs()));
            },
            child: Text("Mostrar Laboratorios"),
          ),

          RaisedButton(
           /* 
            onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>MostraItems()));
            },*/
            child: Text("Mostrar Items de cosa"),
          ),
        ],),
      ),
    );
  }
}
