import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'firebaseConnectDB.dart';

class DetailPage extends StatefulWidget {
  final DocumentSnapshot post;
  DetailPage({this.post});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Laboratorios"),
      ),
    body: Container(
      child: Card(
        child: ListTile(
          title: Text(widget.post.data['title']),
          subtitle: Text(widget.post.data['descripcion']),
          
        ),),
    ));
  }
}

