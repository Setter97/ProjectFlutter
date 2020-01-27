import 'package:flutter/material.dart';

import 'FirebaseUI.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/firebaseUI': (context) => FirebaseUI(),
    },
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('FirebaseUI'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/firebaseUI');
          },
        ),
      ),
    );
  }
}

