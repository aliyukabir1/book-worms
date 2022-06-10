import 'dart:io';
import 'dart:math';

import 'package:bookworms/models/user.dart';
import 'package:bookworms/services/service_injector.dart';

import 'package:image_picker/image_picker.dart';

import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  //declaration
  late bool isEdit;
  String? imagePath, name, state, about;
  int imageKey = 0;
  UserModel? user;

// first function to run
  void init() async {
    setBusy(true);
    isEdit = false;
    try {
      print('start');

      Map<String, dynamic>? data = await si.prof.getProfile();
      print('md');

      user = UserModel.fromJson(data!);
      print('end');
      // name = user?.name;
      // state = user?.state;
      // about = user?.about;
      // imagePath = si.auth.getUser()!.photoURL;
      setBusy(false);
      notifyListeners();
    } catch (e) {
      setError(true);
    }
  }

//toggle edit property
  void toggleEdit() {
    isEdit = !isEdit;
    notifyListeners();
  }

//handle image upload
  void uploadImage() async {
    setBusy(true);
    await ImagePicker().pickImage(source: ImageSource.gallery).then((xfile) {
      si.prof.uploadProfilePic(File(xfile!.path));
      imageKey = Random().nextInt(100);
    });
    setBusy(false);

    notifyListeners();
  }

  //update profile
  Future<void> updateProfile(UserModel? user) async {
    setBusy(true);
    var data = user!.toJson();
    await si.auth.updateUserInfo(data);
    init();
    notifyListeners();
  }
}
