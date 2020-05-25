import 'package:flutter/material.dart';
import 'screens/ShowItemDetails.dart';
import 'screens/ShowItems.dart';
import 'screens/ShowLabs.dart';
import 'screens/AddItem.dart';
import 'screens/AddLab.dart';
import 'screens/SelectItemOrMaterial.dart';
import 'screens/ShowMaterial.dart';
import 'screens/SignInScreen.dart';
import 'screens/ShowCountDetails.dart';

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
      ShowMaterial.routeName: (context) => ShowMaterial(),
      ShowItemDetails.routeName: (context) => ShowItemDetails(),
      SelectItemOrMaterial.routeName: (context) => SelectItemOrMaterial(),
      SignInScreen.routeName: (context) => SignInScreen(),
      ShowCountDetails.routeName:(context)=> ShowCountDetails(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
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
            RaisedButton(
              child: Text('Pantalla sign in'),
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.routeName);
              },
            ),
            RaisedButton(
              child: Text('Pantalla datos usuario'),
              onPressed: () {
                Navigator.pushNamed(context, ShowCountDetails.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
