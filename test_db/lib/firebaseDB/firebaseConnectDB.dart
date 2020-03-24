import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseConnectDB {
  final databaseReference = Firestore.instance;
  
  int count = 0;

  void createRecord() async {
    await databaseReference
        .collection("labs")
        .document("Quimica")
        .collection("Items");
    print("Creado laboratorio");
  }

  void createItem(String laboratorio, String nameItem, String description,
      String componentes, String quantity) async {
    count++;
    await databaseReference
        .collection("labs")
        .document("$laboratorio")
        .collection("Items")
        .document("$nameItem")
        .setData({
      'title': '$nameItem',
      'description': '$description',
      'componentes': '$componentes',
      'cantidad': '$quantity'
    });
  }

  void createLab(laboratorio, localizacion, observaciones, foto) async {
    count++;
    await databaseReference
        .collection("labs")
        .document("$laboratorio")
        .setData({
      'nombreLab': '$laboratorio',
      'localizacion': '$localizacion',
      'observaciones': '$observaciones',
      'img': '$foto'
    });
  }

  Future llistaLabs() async {
    QuerySnapshot qn =
        await databaseReference.collection('labs').getDocuments();
    return qn.documents;
  }

  Future llistaItems(nomLab) async {
    QuerySnapshot qn = await databaseReference
        .collection('labs')
        .document('$nomLab')
        .collection('Items')
        .getDocuments();
    return qn.documents;
  }

  Future llistaMateriales(nomLab) async {
    QuerySnapshot qn = await databaseReference
        .collection('labs')
        .document('$nomLab')
        .collection('Materiales')
        .getDocuments();
    return qn.documents;
  }
}
