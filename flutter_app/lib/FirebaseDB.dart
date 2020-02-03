class FirebaseDB{

  static final FirebaseDB _singleton = FirebaseDB._internal();

  factory FirebaseDB(){
    return _singleton;
  }

  FirebaseDB._internal();
}