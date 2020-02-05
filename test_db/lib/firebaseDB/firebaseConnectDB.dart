import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseConnectDB{
  final databaseReference=Firestore.instance;
  int count=0;
  void createRecord()async{
    await databaseReference.collection("labs")
    .document("Quimica").collection("Items");
    print("Creado laboratorio");
  }

  void createItem(String laboratorio,String nameItem,String description,String componentes,String quantity)async{
    count++;
    await databaseReference.collection("labs").document("$laboratorio").collection("Items")
    .document("$nameItem")
    .setData({
      'title':'$nameItem',
      'description':'$description',
      'componentes':'$componentes',
      'cantidad':'$quantity'
    });
    
  }
}