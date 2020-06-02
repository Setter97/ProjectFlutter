import 'package:flutter/material.dart';
import '../util/logInGoogle.dart';

class ShowCountDetails extends StatelessWidget {
  static const routeName='/showcountdetails';
    var nom=LogInGoogle().getInfo();
    var info;
  @override
  Widget build(BuildContext context) {  
    if(nom==null){
      nom="Error;Tienes que iniciar sesión antes de poder utilizar esta sección;Error en el inicio de sesión";
    }
    info=nom.split(";");
    return Scaffold(
        appBar: AppBar(
          title: Text(info[0]),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: new Text("Nombre:\t"+info[1]+".\nUUID:\t"+info[2]+"."),
        ));
  }
}