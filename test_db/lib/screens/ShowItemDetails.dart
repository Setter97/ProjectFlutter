import 'package:flutter/material.dart';
import '../util/ScreenArguments.dart';


class ShowItemDetails extends StatelessWidget {
  static const routeName = '/showItemDetails';
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
              Text(
                "Cantidades: "+args.superPost.data['cantidades']+"\n"
                "Casa comercial: "+args.superPost.data['casa comercial']+"\n"
                "Categoria: "+args.superPost.data['categoria']+"\n"
                "Fecha de caducidad: "+args.superPost.data['fecha de caducidad']+"\n"
                "Ficha de seguridad: "+args.superPost.data['ficha de seguridad']+"\n"
                "Fotografia: "+args.superPost.data['fotografia']+"\n"
                "Localizacion: "+args.superPost.data['localizacion']+"\n"
                "Nombre: "+args.superPost.data['nombre']+"\n"
                "Observaciones: "+args.superPost.data['observaciones']+"\n"
                "Referencia: "+args.superPost.data['referencia']+"\n"
                "Unidades: "+args.superPost.data['unidades']+"\n"
                "Lab: "+args.superPost.data['lab']
              ),
              RaisedButton(
                onPressed: () => null,
                child: Text("Editar reactivo"),
              ) 
            ],
          )
    ));
  }
}
