import 'package:bookworms/models/user.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:stacked/stacked.dart';

class FavouriteViewModel extends BaseViewModel {
  late List<UserModel?> data;
  init() async {
    setBusy(true);
    try {
      data = await si.friendServices.getFriends();
      setBusy(false);
    } catch (e) {
      setError(true);
    }
    notifyListeners();
  }
}
