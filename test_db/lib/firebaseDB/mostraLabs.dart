import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_db/firebaseDB/mostraItems.dart';
import 'firebaseConnectDB.dart';


class MostraLabs extends StatefulWidget {
  @override
  _MostraLabsState createState() => _MostraLabsState();
}

class _MostraLabsState extends State<MostraLabs> {
   
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Laboratorios"),
      ),

      body: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  //Metodo para ir a DetailPage


navigateToItems(DocumentSnapshot post){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>MostraItems(post: post,)));
}
  @override
  Widget build(BuildContext context) {
     FirebaseConnectDB fireDB=FirebaseConnectDB();
    return Container(
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
                onTap: ()=>navigateToItems(snapshot.data[index]),
                ),);
            });
          }
      }),
    );
  }
}





