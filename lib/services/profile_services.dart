import 'dart:io';

import 'package:bookworms/services/service_injector.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileServices {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

// getting users profile
  Future<Map<String, dynamic>?> getProfile() async {
    Map<String, dynamic>? data;
    try {
      await firestore
          .collection('users')
          .where('uid', isEqualTo: si.auth.getUser()!.uid)
          .get()
          .then(((value) {
        data = value.docs[0].data();
      }));

      return data!;
    } catch (e) {
      rethrow;
    }
  }

  //uploading image
  Future<dynamic> uploadProfilePic(File file) async {
    try {
      var user = si.auth.getUser();
      var response = await storage
          .ref('profilePic/$file')
          .putFile(file)
          .then((p0) => p0.ref.getDownloadURL());
      user!.updatePhotoURL(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
