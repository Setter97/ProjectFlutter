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
  var laboratorio;
  var localizacion;
  var observaciones;
  var foto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear laboratorio"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre laboratorio',
                ),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (val) {
                  laboratorio=val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Localizacion',
                ),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (val) {
                  localizacion=val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Observaciones',
                ),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (val) {
                  observaciones=val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Foto *WIP*',
                ),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (val) {
                  foto=val;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: (){
                  fireDB.createLab(laboratorio, localizacion, observaciones, foto);
                },
                child: Text('Crear laboratorio'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
