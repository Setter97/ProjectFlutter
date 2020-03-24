import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ShowItemDetails.dart';
import '../util/ScreenArguments.dart';
import '../firebaseDB/firebaseConnectDB.dart';
class ShowItems extends StatelessWidget {
  static const routeName='/showItems';

  navigateToDetail(DocumentSnapshot post,context){
    Navigator.pushNamed(context, ShowItemDetails.routeName,arguments: ScreenArguments(post));
}
  @override
  Widget build(BuildContext context) {
     ScreenArguments args=ModalRoute.of(context).settings.arguments;
    FirebaseConnectDB fireDB = new FirebaseConnectDB();
return Scaffold(
        appBar: new AppBar(
          title: new Text("Items de "+args.superPost.data['nombreLab']),
        ),
        body: Container(
          child: FutureBuilder(
              future: fireDB.llistaItems(args.superPost.data['nombreLab']),
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
                          onTap:()=> navigateToDetail(snapshot.data[index],context),
                        ));
                      });
                }
              }),
        ));
  }
}