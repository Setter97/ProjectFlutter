import 'package:flutter/material.dart';
import 'package:test_db/firebaseDB/firebaseConnectDB.dart';
import 'package:test_db/util/logInGoogle.dart';
import 'screens/ShowItemDetails.dart';
import 'screens/ShowItems.dart';
import 'screens/ShowLabs.dart';
import 'screens/AddItem.dart';
import 'screens/AddLab.dart';
import 'screens/SelectItemOrMaterial.dart';
import 'screens/ShowMaterial.dart';

import 'screens/ShowCountDetails.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes',
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
      ShowCountDetails.routeName: (context) => ShowCountDetails(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    LogInGoogle().signInWithGoogle();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla principal'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Añadir lab'),
              onPressed: () {
                Navigator.of(context).pushNamed('/addLab');
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
              child: Text('Sign in'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                LogInGoogle().signInWithGoogle();
              },
            ),
            RaisedButton(
              child: Text('Sign out'),
              textColor: Colors.white,
              color: Colors.red,
              onPressed: () {
                //Navigator.pushNamed(context, SignInScreen.routeName);
                LogInGoogle().signOutGoogle();
              },
            ),
            RaisedButton(
              child: Text('Detalles de la cuenta'),
              onPressed: () {
                if (LogInGoogle().getInfo() == null) {
                  LogInGoogle().signInWithGoogle().whenComplete(() =>
                      Navigator.pushNamed(context, ShowCountDetails.routeName));
                } else {
                  Navigator.pushNamed(context, ShowCountDetails.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
