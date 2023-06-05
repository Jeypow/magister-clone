import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:magister_clone/models/users.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user obj
  Myuser? _userfromFirebase(User user) {
    return user != null ? Myuser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Myuser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userfromFirebase(user!)!);
  }

  // sign anon
  Future signInAnon() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User? user = credential.user;
      return _userfromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // login email password
  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;

      return _userfromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register email password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      //create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData(
          'nome', 'manha', 'dia', 'matricula', 'aluno', 'mgp', 'curso', 'foto');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //logout
  Future singOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      print('deslogado');
      return null;
    }
  }
}
