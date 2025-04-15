import 'package:flutter/material.dart';
import 'package:todoapp/app_theme.dart';

// ignore: must_be_immutable
class DefaultElevatedButton extends StatelessWidget {
  Widget child;
  VoidCallback onPressed;
  DefaultElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            fixedSize: Size(
              width,
              50,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: child);
  }
}
