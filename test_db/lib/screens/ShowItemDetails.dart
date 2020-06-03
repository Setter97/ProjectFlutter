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
          child: Card(
            child: ListTile(
              title: Text("Nombre: " + args.superPost.data['nombre']),
              subtitle: Text("Cantidad: " + args.superPost.data['cantidades']),
            ),
          ),
        ));
  }
}
