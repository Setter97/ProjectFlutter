import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_db/main.dart';
import 'firebaseConnectDB.dart';


class MostraItems extends StatefulWidget {
  final DocumentSnapshot post;
  MostraItems({this.post});
  @override
  _MostraItemsState createState() => _MostraItemsState();
}

class _MostraItemsState extends State<MostraItems> {
  FirebaseConnectDB fireDB = FirebaseConnectDB();

navigateToDetail(DocumentSnapshot post){
  Navigator.push(super.context, MaterialPageRoute(builder: (context)=>MyApp()));
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Items de "+widget.post.data['nombreLab']),
        ),
        body: Container(
          child: FutureBuilder(
              future: fireDB.llistaItems(widget.post.data['nombreLab']),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Loading..."),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return Card(
                          child: ListTile(
                          title: Text(snapshot.data[index].data['title']),
                          subtitle: Text(snapshot.data[index].data['description']),
                          //onTap: navigateToDetail(snapshot.data[index]),
                        ));
                      });
                }
              }),
        ));
  }
}