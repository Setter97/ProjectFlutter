import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_db/util/logInGoogle.dart';

class FirebaseConnectDB {
  final databaseReference = Firestore.instance;

  int count = 0;
  String obj = LogInGoogle().getInfo();

  void createRecord() async {
    databaseReference
        .collection("labs")
        .document("Quimica")
        .collection("Items");
    print("Creado laboratorio");
  }

  void createItem(
      String laboratorio,
      String nombre,
      String categoria,
      String localizacion,
      String unidades,
      String cantidades,
      String referencia,
      String casaCom,
      String fechaCad,
      String observaciones,
      String fotografia,
      String fichaSeg) async {
    if (obj != null) {
      var info = obj.split(";");
      var date = new DateTime.now().toString().split(".")[0];
      await databaseReference
          .collection("labs")
          .document("$laboratorio")
          .collection("Reactivos")
          .document("$nombre")
          .setData({
        'nombre': '$nombre',
        'categoria': '$categoria',
        'localizacion': '$localizacion',
        'unidades': '$unidades',
        'cantidades': '$cantidades',
        'referencia': '$referencia',
        'casa comercial': '$casaCom',
        'fecha de caducidad': '$fechaCad',
        'observaciones': '$observaciones',
        'fotografia': '$fotografia',
        'ficha de seguridad': '$fichaSeg',
      });

      await databaseReference
          .collection("log")
          .document(info[1])
          .collection("Añadido")
          .document('$date $laboratorio $nombre')
          .setData({
        'Laboratorio': '$laboratorio',
        'Reactivo': '$nombre',
        'Fecha de creación': '$date',
        'nombre': '$nombre',
        'categoria': '$categoria',
        'localizacion': '$localizacion',
        'unidades': '$unidades',
        'cantidades': '$cantidades',
        'referencia': '$referencia',
        'casa comercial': '$casaCom',
        'fecha de caducidad': '$fechaCad',
        'observaciones': '$observaciones',
        'fotografia': '$fotografia',
        'ficha de seguridad': '$fichaSeg',
      });
    }
  }

  void createMaterial(
      String laboratorio,
      String nombre,
      String tipo,
      String localizacion,
      String cantidad,
      String referencia,
      String observaciones,
      String foto,
      String fechaCompra) async {
    if (obj != null) {
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
  }

  void createLab(laboratorio, localizacion, observaciones, foto) async {
    if (obj != null) {
      var info = obj.split(";");
      await databaseReference
          .collection("labs")
          .document("$laboratorio")
          .setData({
        'nombreLab': '$laboratorio',
        'localizacion': '$localizacion',
        'observaciones': '$observaciones',
        'img': '$foto'
      });

      await databaseReference
          .collection("log")
          .document(info[1])
          .collection("Añadido")
          .document(laboratorio)
          .setData({'Añadido LOG': 'Añadido $laboratorio'});
    }
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
        .collection('Reactivos')
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

  void deleteIM(nomLab, thisDoc, lugar) async {
    if (obj != null) {
      var date = new DateTime.now().toString().split(".")[0];

      var info = obj.split(";");
      await databaseReference
          .collection('labs')
          .document('$nomLab')
          .collection('$lugar')
          .document(thisDoc)
          .delete();
      await databaseReference
          .collection("log")
          .document(info[1])
          .collection("Eliminado")
          .document('$date $nomLab $thisDoc')
          .setData({
        'Laboratorio': '$nomLab',
        'Item': '$thisDoc',
        'Fecha de eliminacion': '$date'
      });
    }
  }

  void deleteLab(nomLab) async {
    if (obj != null) {
      var info = obj.split(";");
      await databaseReference.collection('labs').document('$nomLab').delete();

      await databaseReference
          .collection("log")
          .document(info[1])
          .collection("Eliminado")
          .document(nomLab)
          .setData({'Eliminado LOG': '$nomLab'});
    }
  }
}
