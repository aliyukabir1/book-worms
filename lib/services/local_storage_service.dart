import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? pref;
  Future initPref() async {
    pref = await SharedPreferences.getInstance();
  }

//   Future<void> setLogin(bool islogin) async {
//     await initPref();
//     await pref!.setBool('login', islogin);
//     print('done+${pref!.getBool('login')}');
//   }

//   bool getLogin() {
//     initPref();

//     if (pref?.getBool('login') == true) {
//       print('obje');
//       print(pref?.getBool('login'));
//       return true;
//     } else {
//       print(pref?.getBool('login'));
//       return false;
//     }
//   }
}
