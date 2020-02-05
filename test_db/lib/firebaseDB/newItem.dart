import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebaseConnectDB.dart';
/*
class newItem extends StatefulWidget {
  newItem({Key key}) : super(key: key);

  @override
  _newItemState createState() => _newItemState();
}

class _newItemState extends State<newItem> {
  @override
  FirebaseConnectDB fireDB = new FirebaseConnectDB();
  String nameItem = "";
  String description = "";
  String componentes = "";
  String quantity = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Añadir item"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                  ),
                  onChanged: (val) {
                    setState(() => nameItem = val);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Descripcion',
                  ),
                  onChanged: (val) {
                    setState(() => description = val);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Componentes',
                  ),
                  onChanged: (val) {
                    setState(() => componentes = val);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cantidad',
                  ),
                  onChanged: (val) {
                    setState(() => quantity = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink,
                  child: Text(
                    'Introducir item',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    setState(() {
                      fireDB.createItem(
                          nameItem, description, componentes, quantity);
                      final snackBar = SnackBar(
                        content: Text('Yay! A SnackBar!'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Algo de código para ¡deshacer el cambio!
                          },
                        ),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                    });
                  },
                ),
              ],
            ),
          ),
        ));
  }
}*/

class newItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nameItem = "";
    var description = "";
    var componentes = "";
    var quantity = "0";
    var laboratorio = "";
    FirebaseConnectDB fireDB = new FirebaseConnectDB();
    return Scaffold(
        appBar: AppBar(
          title: Text("Añadir item"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
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
                    nameItem = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Descripcion',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    description = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Componentes',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (val) {
                    componentes = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cantidad',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  onChanged: (val) {
                    quantity = val;
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink,
                  child: Text(
                    'Introducir item',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    fireDB.createItem(laboratorio,
                        nameItem, description, componentes, quantity);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
