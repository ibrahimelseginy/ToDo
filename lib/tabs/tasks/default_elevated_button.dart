import 'package:flutter/material.dart';
import 'package:todoapp/apptheme.dart';

// ignore: must_be_immutable
class DefaultElevatedButton extends StatelessWidget {
  String label;
  VoidCallback onpressed;

  DefaultElevatedButton(
      {super.key, required this.label, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          fixedSize: Size(
            MediaQuery.of(context).size.width,
            50,
          )),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppTheme.whiteColor),
      ),
    );
  }
}
