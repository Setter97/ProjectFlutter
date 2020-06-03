import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../util/ScreenArguments.dart';
import 'ShowItems.dart';
import 'ShowMaterial.dart';

class SelectItemOrMaterial extends StatelessWidget {
  static const routeName = "/SelectItemOrMaterial";
  var nombreLab = "";
  void comprueba(postString) {
    if (postString == null) {
      nombreLab = "";
    } else {
      nombreLab = postString;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    comprueba(args.superPost.data["nombreLab"]);
    
    navigateToItems(DocumentSnapshot post, context) {
      Navigator.pushNamed(context, ShowItems.routeName,
          arguments: ScreenArguments(post));
    }

    navigateToMaterial(DocumentSnapshot post, context) {
      Navigator.pushNamed(context, ShowMaterial.routeName,
          arguments: ScreenArguments(post));
    }

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Lab: " + nombreLab),
      ),
      body: Container(
        child: new Column(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text("Reactivos"),
                onTap: () => navigateToItems(args.superPost, context),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Materiales"),
                onTap: () => navigateToMaterial(args.superPost, context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
