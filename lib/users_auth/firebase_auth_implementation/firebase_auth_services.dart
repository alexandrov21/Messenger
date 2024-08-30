
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_app/models/sign_up_model.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String enteringEmail, String enteringPassword) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: enteringEmail, password: enteringPassword);
      return credential.user;
    } catch(e) {
      print('some errore');
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch(e) {
      print('some errore');
    }
    return null;
  }
}