import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<dynamic> getAll(String collection) async {}

  String getCurrentUser() {
    String? email = auth.currentUser!.email;
    return email!;
  }

  bool isLoggedIn() {
    var user = auth.currentUser;
    return user == null ? false : true;
  }

  Future signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return null;
    }
  }

  Future signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return null;
    }
  }
}
