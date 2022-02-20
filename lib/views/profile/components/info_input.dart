import 'package:bookworms/constants.dart';
import 'package:flutter/material.dart';

class InfoInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? prefixText, hintText;
  final IconData? icon;
  final int? maxline;
  final bool readOnly;
  const InfoInput({
    Key? key,
    this.icon,
    this.prefixText,
    this.maxline = 1,
    required this.readOnly,
    this.controller,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxline,
      style: const TextStyle(color: colorWhite),
      readOnly: !readOnly,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: colorGrey),
          prefixIcon: Icon(
            icon,
            color: colorGrey,
          ),
          suffixIcon: readOnly
              ? const Icon(
                  Icons.mode_edit_sharp,
                  color: Colors.red,
                )
              : null,
          prefixText: prefixText,
          prefixStyle: const TextStyle(color: colorGrey),
          border: InputBorder.none,
          focusColor: scaffoldbg.withOpacity(0.5)),
    );
  }
}
