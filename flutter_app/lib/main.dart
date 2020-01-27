import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("PRUEABA App"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),

        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: null,
                child: Text("Hola"),
              )
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Text("Click"),
          backgroundColor: Colors.pinkAccent,
        ),
      ),
    );
  }
}