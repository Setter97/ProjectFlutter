import 'package:flutter/material.dart';
import 'package:test_db/main.dart';
import 'package:test_db/util/logInGoogle.dart';
import '../firebaseDB/firebaseConnectDB.dart';

class AddLab extends StatelessWidget {
  static const routeName = '/addLab';
  @override
  Widget build(BuildContext context) {
    var fireDB = FirebaseConnectDB();
    var laboratorio;
    var localizacion;
    var observaciones;
    var foto;
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
                  laboratorio = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Localizacion',
                ),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (val) {
                  localizacion = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Observaciones',
                ),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (val) {
                  observaciones = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Foto *WIP*',
                ),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (val) {
                  foto = val;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                    fireDB.createLab(
                        laboratorio, localizacion, observaciones, foto);
                    Navigator.of(context).pop();
                  
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
