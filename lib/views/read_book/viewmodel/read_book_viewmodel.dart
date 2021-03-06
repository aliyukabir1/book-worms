import 'package:bookworms/services/service_injector.dart';
import 'package:stacked/stacked.dart';

class ReadBookViewModel extends BaseViewModel {
  List? data;
  init() async {
    setBusy(true);
    try {
      data = await si.bookServices.getAllBooks();
      setBusy(false);

      return data;
    } catch (e) {
      setError(true);
    }
  }
}
