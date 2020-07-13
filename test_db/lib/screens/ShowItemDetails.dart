import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_db/firebaseDB/firebaseConnectDB.dart';
import 'package:test_db/screens/EditItem.dart';
import '../util/ScreenArguments.dart';


class ShowItemDetails extends StatelessWidget {
  static const routeName = '/showItemDetails';

navigateToEdit(post, context) {
    Navigator.pushNamed(context, EditItem.routeName,
        arguments: ScreenArguments(post));
  }


  @override
  Widget build(BuildContext context) {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Reactivo: " + args.superPost.data['nombre']),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: new Column(
            children: <Widget>[
              StreamBuilder(
                stream: FirebaseConnectDB().itemStream(args.superPost.data['lab'], args.superPost.data['nombre']),
                builder: (context, snapshot) =>  
                    new Text(
                        "Cantidades: "+snapshot.data['cantidades']+"\n"
                        "Casa comercial: "+snapshot.data['casa comercial']+"\n"
                        "Categoria: "+snapshot.data['categoria']+"\n"
                        "Fecha de caducidad: "+snapshot.data['fecha de caducidad']+"\n"
                        "Ficha de seguridad: "+snapshot.data['ficha de seguridad']+"\n"
                        "Fotografia: "+snapshot.data['fotografia']+"\n"
                        "Localizacion: "+snapshot.data['localizacion']+"\n"
                        "Nombre: "+snapshot.data['nombre']+"\n"
                        "Observaciones: "+snapshot.data['observaciones']+"\n"
                        "Referencia: "+snapshot.data['referencia']+"\n"
                        "Unidades: "+snapshot.data['unidades']+"\n"
                        "Lab: "+snapshot.data['lab']
                    ),
                  
                
              ),
              RaisedButton(
                onPressed: () => navigateToEdit(args.superPost, context),
                child: Text("Editar reactivo"),
              ) 
            ],
          )
    ));
  }
}
