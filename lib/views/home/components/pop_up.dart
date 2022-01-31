import 'package:bookworms/services/service_injector.dart';
import 'package:bookworms/views/auth/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sign Out'),
      content: const Text('Are you sure you want to exit?'),
      actions: [
        TextButton(
            onPressed: () async {
              await si.auth.signOut();
              si.router.popUntil(context, SignIn());
            },
            child: const Text('Yes')),
        TextButton(
            onPressed: () {
              si.router.popScreen(context);
            },
            child: const Text('No'))
      ],
    );
  }
}
