import 'package:flutter/material.dart';
import '../firebaseDB/firebaseConnectDB.dart';
import 'package:flutter/services.dart';

class AddItem extends StatelessWidget {
  static const routeName = '/addItem';
  @override
  Widget build(BuildContext context) {
    var laboratorio = "";
    var nombre = "";
    var categoria = "";
    var localizacion = "";
    var unidades = "0";
    var cantidades = "";
    var referencia = "";
    var casaCom = "";
    var fechaCad = "";
    var observaciones = "";
    var fotografia = "";
    var fichaSeg = "";
    //FirebaseConnectDB fireDB = new FirebaseConnectDB();
    return Scaffold(
        appBar: AppBar(
          title: Text("Añadir item"),
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
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    laboratorio = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    nombre = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                  ),
                  onChanged: (val) {
                    categoria = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Localizacion',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    localizacion = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cantidades',
                  ),
                  
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
                  onChanged: (val) {
                    unidades = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Referencia',
                  ),
                  onChanged: (val) {
                    referencia = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Casa Comercial',
                  ),
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
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    fechaCad = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Observaciones',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    observaciones = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Fotografia *WIP*',
                  ),
                  onChanged: (val) {
                    fotografia = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ficha de seguridad',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    fichaSeg = val;
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink,
                  child: Text(
                    'Introducir ítem',
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

                        //Navigator.pop(context);
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
