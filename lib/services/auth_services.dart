import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  String getCurrentUser() {
    String? email = auth.currentUser!.email;
    return email!;
  }

  bool isLoggedIn() {
    var user = auth.currentUser;
    return user == null ? false : true;
  }

  User? getUser() {
    var user = auth.currentUser;
    return user;
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
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        firestore.collection('users').doc(value.user!.uid).set({
          'uid': value.user!.uid,
          'state': '',
          'profile': value.user!.photoURL,
          'about': ''
        });
      });
    } catch (e) {
      return null;
    }
  }

  // update user info
  Future<void> updateUserInfo(Map<String, dynamic> data) async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update(data);
  }
}
