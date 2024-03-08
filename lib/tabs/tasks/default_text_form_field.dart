import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxlines;

  const DefaultTextFormField(
      {super.key,
      required this.hintText,
      this.maxlines,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      maxLines: maxlines,
    );
  }
}
