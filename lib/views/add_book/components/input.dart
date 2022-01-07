import 'package:bookworms/constants.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const Input(
      {Key? key, this.controller, required this.hintText, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {},
        validator: validator,
        textCapitalization: TextCapitalization.words,
        cursorColor: colorWhite,
        style: const TextStyle(color: colorWhite, fontSize: 20),
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            hintText: hintText,
            fillColor: colorGrey,
            filled: true,
            focusColor: Colors.grey),
      ),
    );
  }
}
