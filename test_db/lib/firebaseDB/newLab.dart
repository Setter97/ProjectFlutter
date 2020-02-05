import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'firebaseConnectDB.dart';

class newLab extends StatefulWidget {
  newLab({Key key}) : super(key: key);

  @override
  _newLabState createState() => _newLabState();
}

class _newLabState extends State<newLab> {
  FirebaseConnectDB fireDB = new FirebaseConnectDB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LAB"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              disabledColor: Colors.grey,
              onPressed: () {
                null;
              },
              child: Text("Afegir laboratori de quimica"),
            ),
          ],
        ),
      ),
    );
  }
}
