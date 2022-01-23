import 'package:bookworms/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? function;
  const CustomButton({Key? key, required this.title, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: colorGrey,
      elevation: 30,
      onPressed: function,
      child: Text(
        title,
        style: const TextStyle(color: colorWhite, fontSize: 20),
      ),
    );
  }
}
