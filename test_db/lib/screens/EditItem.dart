import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_db/util/ScreenArguments.dart';
import '../firebaseDB/firebaseConnectDB.dart';
import 'package:flutter/services.dart';

class EditItem extends StatelessWidget {
  static const routeName = '/editItem';
  //EditItem(laboratorio,nombre,categoria,localizacion,unidades,cantidades,referencia,casaCom,fechaCad,observaciones,fotografia,fichaSeg);

  

  @override
  Widget build(BuildContext context) {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    var laboratorio = args.superPost.data['lab'];
    var nombre = args.superPost.data['nombre'];
    var categoria = args.superPost.data['categoria'];
    var localizacion = args.superPost.data['localizacion'];
    var unidades = args.superPost.data['unidades'];
    var cantidades = args.superPost.data['cantidades'];
    var referencia = args.superPost.data['referencia'];
    var casaCom = args.superPost.data['casa comercial'];
    var fechaCad = args.superPost.data['fecha de caducidad'];
    var observaciones = args.superPost.data['observaciones'];
    var fotografia = args.superPost.data['fotografia'];
    var fichaSeg = args.superPost.data['ficha de seguridad'];
    
    //FirebaseConnectDB fireDB = new FirebaseConnectDB();
    return Scaffold(
        appBar: AppBar(
          title: Text("Editar item"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: ListView(
            shrinkWrap:true,
            children:<Widget> [
              Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Laboratorio',
                  ),
                  initialValue: laboratorio,
                  enabled: false,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    laboratorio = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                  ),
                  initialValue: nombre,
                  enabled: false,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    nombre = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                  ),
                  initialValue: categoria,
                  onChanged: (val) {
                    categoria = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Localizacion',
                  ),
                  initialValue: localizacion,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    localizacion = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cantidades',
                  ),
                  initialValue: cantidades,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  onChanged: (val) {
                    cantidades = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Unidadaes',
                  ),
                  initialValue: unidades,
                  onChanged: (val) {
                    unidades = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Referencia',
                  ),
                  initialValue: referencia,
                  onChanged: (val) {
                    referencia = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Casa Comercial',
                  ),
                  initialValue: casaCom,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    casaCom = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Fecha de Caducidad',
                    hintText: "dd-mm-yyyy",
                  ),
                  initialValue: fechaCad,
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    fechaCad = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Observaciones',
                  ),
                  initialValue: observaciones,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    observaciones = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Fotografia *WIP*',
                  ),
                  initialValue: fotografia,
                  onChanged: (val) {
                    fotografia = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ficha de seguridad',
                  ),
                  initialValue: fichaSeg,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    fichaSeg = val;
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink,
                  child: Text(
                    'Guardar cambios',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    FirebaseConnectDB().createItem(
                        laboratorio,
                        nombre,
                        categoria,
                        localizacion,
                        unidades,
                        cantidades,
                        referencia,
                        casaCom,
                        fechaCad,
                        observaciones,
                        fotografia,
                        fichaSeg);

                        Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
            ],
          )
        ));
  }
}
