import 'package:bookworms/constants.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final int? maxLines;

  const Input(
      {Key? key,
      this.controller,
      required this.hintText,
      this.validator,
      this.textCapitalization,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        // if anythig goes wrong, delete this onchanged;
        onChanged: (value) {
          controller!.text = value;
        },
        maxLines: maxLines,
        controller: controller,
        validator: validator,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
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
