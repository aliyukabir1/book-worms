import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RouterService {
  void popScreen(BuildContext context) {
    Navigator.pop(context);
  }

  void nextScreen(BuildContext context, Widget widget) {
    Navigator.push(context,
        MaterialPageRoute<Widget>(builder: (BuildContext context) => widget));
  }

  void replaceScreen(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context,
        MaterialPageRoute<Widget>(builder: (BuildContext context) => widget));
  }

  void popUntil(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<Widget>(builder: (BuildContext context) => widget),
        (Route<dynamic> route) => false);
    ModalRoute.withName('/');
  }

  void exitApp() {
    SystemChannels.platform.invokeMethod<String>('SystemNavigator.pop');
  }
}
