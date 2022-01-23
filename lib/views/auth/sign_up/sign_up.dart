import 'package:bookworms/constants.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:bookworms/views/add_book/components/input.dart';
import 'package:bookworms/views/customs_widgets/button.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final _signupKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: scaffoldbg,
          elevation: 0,
          title: const Text('Register',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Form(
            key: _signupKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Input(
                controller: email,
                hintText: 'email@gmail.com',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field can not be empty';
                  }
                },
              ),
              const SizedBox(height: 30),
              Input(
                controller: password,
                hintText: 'password',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field can not be empty';
                  }
                },
              ),
              const SizedBox(height: 40),
              CustomButton(
                title: 'Sign Up',
                function: () async {
                  if (_signupKey.currentState!.validate()) {
                    await si.bookServices.signUp(email.text, password.text);
                    si.router.popScreen(context);
                  }
                },
              )
            ]),
          ),
        ));
  }
}
