import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ShowItemDetails.dart';
import '../util/ScreenArguments.dart';
import '../firebaseDB/firebaseConnectDB.dart';

class ShowItems extends StatelessWidget {
  static const routeName = '/showItems';

  navigateToDetail(DocumentSnapshot post, context) {
    Navigator.pushNamed(context, ShowItemDetails.routeName,
        arguments: ScreenArguments(post));
  }

  delete(nomLab, DocumentSnapshot post, context, FirebaseConnectDB fireDB) {
    print(nomLab);
    print(post.data["nombre"]);
    fireDB.deleteIM(nomLab, post.data["nombre"], "Reactivos");
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    var fireDB = FirebaseConnectDB();
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Reactivos de " + args.superPost.data['nombreLab']),
        ),
        body: Container(
          child: StreamBuilder(
              stream: fireDB.llistaItems2(args.superPost.data['nombreLab']),
              builder: (context, snapshot) {
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
                                title:
                                    Text(snapshot.data.documents[index]['nombre']),
                                subtitle: Text(
                                    snapshot.data.documents[index]['observaciones']),
                                onTap: () => navigateToDetail(
                                    snapshot.data.documents[index], context),
                                onLongPress: () => {
                                      delete(
                                          snapshot.data.documents[index]['lab'],
                                          snapshot.data.documents[index],
                                          context,
                                          fireDB),
                                    }));
                      });
                }
              }),
        ));
  }
}
