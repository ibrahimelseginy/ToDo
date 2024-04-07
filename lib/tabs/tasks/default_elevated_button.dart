import 'package:flutter/material.dart';
import 'package:todoapp/apptheme.dart';

// ignore: must_be_immutable
class DefaultElevatedButton extends StatelessWidget {
  Widget child;
  VoidCallback onpressed;

  DefaultElevatedButton(
      {super.key, required this.child, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          fixedSize: Size(
            MediaQuery.of(context).size.width,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: child);
  }
}
