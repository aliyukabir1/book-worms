import 'package:bookworms/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

//the current user using the app
  String getCurrentUser() {
    String? email = auth.currentUser!.email;
    return email!;
  }

// checks if theres a user loggedin
  bool isLoggedIn() {
    var user = auth.currentUser;
    return user == null ? false : true;
  }

// gets user
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
      rethrow;
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
          'about': '',
          'email': value.user!.email,
        });
      });
    } catch (e) {
      rethrow;
    }
  }

  // update user info
  Future<void> updateUserInfo(Map<String, dynamic> data) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .update(data);
    } catch (e) {
      rethrow;
    }
  }

// to get all other users
  Future<List<UserModel?>?> getAllUsers() async {
    List<UserModel?> result = [];
    try {
      await firestore.collection('users').get().then((value) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> datas = value.docs;
        for (var element in datas) {
          var data = element.data();

          if (data['uid'] != getUser()!.uid) {
            result.add(UserModel.fromJson(data));
          }
        }
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }

  //get a user with id
  Future<UserModel> getUserWithId(dynamic id) async {
    return firestore
        .collection('users')
        .doc(id)
        .get()
        .then((value) => UserModel.fromJson(value.data()!));
  }
}
