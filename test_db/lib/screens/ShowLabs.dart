import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../util/ScreenArguments.dart';
import 'ShowItems.dart';
import '../firebaseDB/firebaseConnectDB.dart';

class ShowLabs extends StatelessWidget {
  static const routeName='/showLabs';
  navigateToItems(DocumentSnapshot post,context){
    Navigator.pushNamed(
      context, 
      ShowItems.routeName,
      arguments: ScreenArguments(post));
}
  @override
  Widget build(BuildContext context) {
    FirebaseConnectDB fireDB = new FirebaseConnectDB();
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de laboratorios"),
        ),
        body:Container(
      child: FutureBuilder(
        future: fireDB.llistaLabs(),
        builder:
        (_,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: Text("Loading..."),
            );
          }else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_,index){
              return Card(child: ListTile(
                title:Text( snapshot.data[index].data['nombreLab']),
                onTap: ()=>navigateToItems(snapshot.data[index],context),
                ),);
            });
          }
      }),
    ) );
  }
}