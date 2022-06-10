import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  setNumberOfBooksRead(int num) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('booksRead', num);
  }

  Future<int> getNumberOfBooksRead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int value = prefs.getInt('booksRead') ?? 0;
    return value;
  }
}
