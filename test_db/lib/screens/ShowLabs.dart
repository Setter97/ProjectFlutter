import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../util/ScreenArguments.dart';
import '../firebaseDB/firebaseConnectDB.dart';
import 'SelectItemOrMaterial.dart';

class ShowLabs extends StatelessWidget {
  static const routeName = '/showLabs';
  navigateToSelect(DocumentSnapshot post, context) {
    Navigator.pushNamed(context, SelectItemOrMaterial.routeName,
        arguments: ScreenArguments(post));
  }

  deleteLab(DocumentSnapshot post,context,FirebaseConnectDB fireDB){
    fireDB.deleteLab(post.data["nombreLab"]);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    FirebaseConnectDB fireDB = new FirebaseConnectDB();
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de laboratorios"),
        ),
        body: Container(
          child: StreamBuilder(
              stream: fireDB.llistaLabs(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Loading..."),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (_, index) {
                        return Card(
                          child: ListTile(
                            title: Text(snapshot.data.documents[index]['nombreLab']),
                            onTap: () =>
                                navigateToSelect(snapshot.data.documents[index], context),
                            onLongPress:()=>{
                              deleteLab(snapshot.data.documents[index], context, fireDB) ,
                              }
                          ),
                        );
                      });
                }
              }),
        ));
  }
}
