import 'package:bookworms/models/book.dart';
import 'package:bookworms/models/user.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:stacked/stacked.dart';

class SingleUserViewModel extends BaseViewModel {
  List<Book?> booksList = [];
  init(UserModel user) async {
    setBusy(true);
    booksList = await si.bookServices.getOtherUserBooks(user);
    setBusy(false);
    notifyListeners();
  }

  addFriend(String friendId) async {
    await si.friendServices.addFriend(friendId);
  }

  removeFriend(String friendId) async {
    await si.friendServices.removeFriend(friendId);
  }
}
