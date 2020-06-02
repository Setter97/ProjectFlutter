import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInGoogle {
  static final LogInGoogle _instance=LogInGoogle._internal();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  static String info;
  

factory LogInGoogle(){
  return _instance;
}
  LogInGoogle._internal() {
    print("instance created");
  }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    info = user.displayName+";"+user.email+";"+user.uid;
    //getName();
    return "Inicio de sesion realizado correctamente";
  }

String getInfo(){
  //signInWithGoogle();
  return info;
}
  void signOutGoogle() async {
    info=null;
    await googleSignIn.signOut();
    print("User Sign Out");
  }
}
