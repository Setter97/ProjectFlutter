import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_db/util/logInGoogle.dart';

class FirebaseConnectDB {
  final databaseReference = Firestore.instance;

  int count = 0;
  String obj=LogInGoogle().getInfo();

  void createRecord() async {
    databaseReference
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

  void createMaterial(String laboratorio, String nombre, String tipo, String localizacion, String cantidad, String referencia, String observaciones, String foto, String fechaCompra) async {
    count++;
    await databaseReference
        .collection("labs")
        .document("$laboratorio")
        .collection("Material")
        .document("$nombre")
        .setData({
      'title': '$nombre',
      'tipo': '$tipo',
      'localizacion': '$localizacion',
      'observaciones': '$observaciones',
      'referencia': '$referencia',
      'cantidad': '$cantidad',
      'foto': '$foto',
      'fechaCompra': '$fechaCompra'
    });
  }

  void createLab(laboratorio, localizacion, observaciones, foto) async {
    
    var info=obj.split(";");
    await databaseReference
        .collection("labs")
        .document("$laboratorio")
        .setData({
      'nombreLab': '$laboratorio',
      'localizacion': '$localizacion',
      'observaciones': '$observaciones',
      'img': '$foto'
    });

    await databaseReference.collection("log").document(info[1]).collection("Añadido").document(laboratorio).setData({'Prueba LOG': 'Prueba 1'});
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

  void deleteIM(nomLab,thisDoc,lugar)async{
    var info=obj.split(";");
    await databaseReference
        .collection('labs')
        .document('$nomLab')
        .collection('$lugar')
        .document(thisDoc).delete();
    await databaseReference.collection("log").document(info[1]).collection("Eliminado").document(thisDoc).setData({'Eliminado LOG': '$nomLab','Eliminado':'$thisDoc'});
  }

  void deleteLab(nomLab)async{
     var info=obj.split(";");
    await databaseReference
        .collection('labs')
        .document('$nomLab')
        .delete();

    await databaseReference.collection("log").document(info[1]).collection("Eliminado").document(nomLab).setData({'Eliminado LOG': '$nomLab'});
  }
}
