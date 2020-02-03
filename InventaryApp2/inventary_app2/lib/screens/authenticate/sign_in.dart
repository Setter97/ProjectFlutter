import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor:Colors.blueAccent,
        title: Text("Sign in to Inventary"),
        ),

        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal:50.0),
            child: RaisedButton(
              child: Text("hola"),
              onPressed:() async{

              },
            ),
          ),
    );
  }
}