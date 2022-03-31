import 'package:bookworms/services/service_injector.dart';
import 'package:stacked/stacked.dart';

class AllUsersViewModel extends BaseViewModel {
  List<dynamic> data = [];
  init() async {
    setBusy(true);
    try {
      data = await si.auth.getAllUsers() as List;
      setBusy(false);
    } catch (e) {
      setError(true);
    }
    notifyListeners();
  }
}
