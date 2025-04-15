import 'package:flutter/material.dart';
import 'package:todoapp/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: Theme.of(context).brightness == Brightness.light
          ? AppTheme.white
          : AppTheme.black,
    ));
  }
}
