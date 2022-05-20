import 'package:bookworms/models/user.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<UserModel?>> getFriends() async {
    List listOfFriendsId = [];
    List<UserModel?> listOfFriends = [];
    await firestore
        .collection('users')
        .doc(si.auth.getUser()!.uid)
        .get()
        .then((value) {
      listOfFriendsId = value.get('friends');
    });
    for (var i = 0; i < listOfFriendsId.length; i++) {
      listOfFriends.add(await si.auth.getUserWithId(listOfFriendsId[i]));
    }

    return listOfFriends;
  }
}
