import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_db/util/logInGoogle.dart';

class FirebaseConnectDB {
  final databaseReference = Firestore.instance;

  String obj = LogInGoogle().getInfo();

  //Crea un ítem con los datos pasados por parametros
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
      //Creación del ítem en la base de datos
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
      
      //Log
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

  //Crea un material con los datos pasados por parámetro
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
      //Creacion del material en la base de datos
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

  // Crea un laboratorio con los datos pasados por parámetro.
  void createLab(laboratorio, localizacion, observaciones, foto) async {
    if (obj != null) {
      var info = obj.split(";");
      //Creacion en la base de datos
      await databaseReference
          .collection("labs")
          .document("$laboratorio")
          .setData({
        'nombreLab': '$laboratorio',
        'localizacion': '$localizacion',
        'observaciones': '$observaciones',
        'img': '$foto'
      });

      //Log
      await databaseReference
          .collection("log")
          .document(info[1])
          .collection("Añadido")
          .document(laboratorio)
          .setData({'Añadido LOG': 'Añadido $laboratorio'});
    }
  }

  //Lista los laboratorios de la basde de datos
  Future llistaLabs() async {
    QuerySnapshot qn =
        await databaseReference.collection('labs').getDocuments();
    return qn.documents;
  }

  //Lista los ítems del laboratorio pasado por parámetro
  Future llistaItems(nomLab) async {
    QuerySnapshot qn = await databaseReference
        .collection('labs')
        .document('$nomLab')
        .collection('Reactivos')
        .getDocuments();
    return qn.documents;
  }

//Lista de materiales laboratorio pasado por parámetro
  Future llistaMateriales(nomLab) async {
    QuerySnapshot qn = await databaseReference
        .collection('labs')
        .document('$nomLab')
        .collection('Materiales')
        .getDocuments();
    return qn.documents;
  }

//Borra Items o Materiales
  void deleteIM(nomLab, thisDoc, lugar) async {
    if (obj != null) {
      var date = new DateTime.now().toString().split(".")[0];

      //Borra ítem o material
      var info = obj.split(";");
      await databaseReference
          .collection('labs')
          .document('$nomLab')
          .collection('$lugar')
          .document(thisDoc)
          .delete();
      //Log
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
  
  //Borra LAB
  void deleteLab(nomLab) async {
    if (obj != null) {
      var info = obj.split(";");
      //Borra de la base de datos
      await databaseReference.collection('labs').document('$nomLab').delete();
      
      //Log
      await databaseReference
          .collection("log")
          .document(info[1])
          .collection("Eliminado")
          .document(nomLab)
          .setData({'Eliminado LOG': '$nomLab'});
    }
  }
}
