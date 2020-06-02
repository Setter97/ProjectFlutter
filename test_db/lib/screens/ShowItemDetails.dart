import 'package:flutter/material.dart';
import '../util/ScreenArguments.dart';


class ShowItemDetails extends StatelessWidget {
  static const routeName = '/showItemDetails';
  @override
  Widget build(BuildContext context) {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Item: " + args.superPost.data['title']),
        ),
        body: Container(
          child: Card(
            child: ListTile(
              title: Text("Nombre: " + args.superPost.data['title']),
              subtitle: Text("Cantidad: " + args.superPost.data['cantidad']),
            ),
          ),
        ));
  }
}
