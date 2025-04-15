import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField(
      {super.key,
      this.hintText,
      this.labelText,
      this.isPassword = false,
      this.maxlines = 1,
      this.maxlenght = 40,
      required this.controller,
      this.validator});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
    final int maxlenght;
  final int? maxlines;
  final bool isPassword;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        label: widget.labelText != null
            ? Text(
                widget.labelText!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
              )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () => setState(() {
                  isObscure = !isObscure;
                }),
                // toggel
                icon: isObscure
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              )
            : null,
      ),
      obscureText: isObscure,
      maxLines: widget.maxlines,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
