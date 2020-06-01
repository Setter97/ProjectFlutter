import 'package:flutter/material.dart';
import '../firebaseDB/firebaseConnectDB.dart';
import'package:flutter/services.dart';
import 'SignInScreen.dart';

class ShowCountDetails extends StatelessWidget {
  static const routeName='/showcountdetails';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalles de la cuenta"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        ));
  }
}