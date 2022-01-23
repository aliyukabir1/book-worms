import 'package:bookworms/constants.dart';
import 'package:bookworms/services/service_injector.dart';
import 'package:bookworms/views/add_book/components/input.dart';
import 'package:bookworms/views/auth/sign_up/sign_up.dart';
import 'package:bookworms/views/customs_widgets/button.dart';
import 'package:bookworms/views/home/home_view.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final _signInKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: scaffoldbg,
          elevation: 0,
          title: const Text('Log In',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Form(
            key: _signInKey,
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
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        si.router.nextScreen(context, SignUp());
                      },
                      child: const Text('Register')),
                  TextButton(
                      onPressed: () {}, child: const Text('forgot password'))
                ],
              ),
              const SizedBox(height: 30),
              CustomButton(
                title: 'Log In',
                function: () async {
                  if (_signInKey.currentState!.validate()) {
                    await si.bookServices
                        .signIn(email.text, password.text)
                        .then((value) =>
                            si.router.replaceScreen(context, const Home()));
                  }
                },
              )
            ]),
          ),
        ));
  }
}
