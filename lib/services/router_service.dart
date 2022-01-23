import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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

  void exitApp() {
    SystemChannels.platform.invokeMethod<String>('SystemNavigator.pop');
  }
}
