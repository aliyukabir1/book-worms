import 'package:bookworms/models/book.dart';
import 'package:bookworms/models/user.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:stacked/stacked.dart';

class SingleUserViewModel extends BaseViewModel {
  bool like = false;
  List<Book?> booksList = [];
  init(UserModel user) async {
    setBusy(true);
    booksList = await si.bookServices.getOtherUserBooks(user);
    setBusy(false);
    notifyListeners();
  }

  toggleLike() {
    like = !like;

    notifyListeners();
  }
}
