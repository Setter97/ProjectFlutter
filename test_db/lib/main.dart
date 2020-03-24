import 'package:flutter/material.dart';
import 'screens/ShowItemDetails.dart';
import 'screens/ShowItems.dart';
import 'screens/ShowLabs.dart';
import 'screens/AddItem.dart';
import 'screens/AddLab.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      AddLab.routeName: (context) => AddLab(),
      AddItem.routeName: (context) => AddItem(),
      ShowLabs.routeName: (context) => ShowLabs(),
      ShowItems.routeName: (context) => ShowItems(),
      ShowItemDetails.routeName: (context) => ShowItemDetails(),
    },
  ));
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          RaisedButton(
          child: Text('Añadir lab'),
          onPressed: () {
            Navigator.pushNamed(context, '/addLab');
          },
        ),
          RaisedButton(
          child: Text('Añadir item'),
          onPressed: () {
            Navigator.pushNamed(context, '/addItem');
          },
        ),
          RaisedButton(
          child: Text('Mostrar Laboratorios'),
          onPressed: () {
            Navigator.pushNamed(context, ShowLabs.routeName);
          },
        ),
        ],),
      ),
    );
  }
}