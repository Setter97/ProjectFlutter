import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_db/main.dart';
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
          child: FutureBuilder(
              future: fireDB.llistaLabs(),
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
                            title: Text(snapshot.data[index].data['nombreLab']),
                            onTap: () =>
                                navigateToSelect(snapshot.data[index], context),
                            onLongPress:()=>{
                              deleteLab(snapshot.data[index], context, fireDB) ,
                              }
                          ),
                        );
                      });
                }
              }),
        ));
  }
}
