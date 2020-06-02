import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_db/screens/SignInScreen.dart';
import '../firebaseDB/firebaseConnectDB.dart';
import'package:flutter/services.dart';
import '../util/logInGoogle.dart';

class ShowCountDetails extends StatelessWidget {
  static const routeName='/showcountdetails';
    var nom=LogInGoogle().getInfo();
    var info;
  @override
  Widget build(BuildContext context) {  
    if(nom==null){
      nom="Error;Tienes que iniciar sesion antes de poder utilizar esta seccion;Error en el inicio de sesion";
    }
    info=nom.split(";");
    return Scaffold(
        appBar: AppBar(
          title: Text(info[0]),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: new Text("Nombre:\t"+info[1]+"\nUUID:\t"+info[2]),
        ));
  }
}