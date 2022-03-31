import 'package:bookworms/models/user.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:stacked/stacked.dart';

class SingleUserViewModel extends BaseViewModel {
  bool like = false;
  init(UserModel user) async {
    await si.bookServices.getOtherUserBooks(user);
  }

  toggleLike() {
    like = !like;

    notifyListeners();
  }
}
