import 'package:civic_connect/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final String backTo;
  const CustomBackButton({super.key, required this.backTo});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: const ButtonStyle(iconSize: WidgetStatePropertyAll(24)),
      icon: const Icon(Icons.arrow_back, color: AppTheme.themeGray),
      onPressed: () {
        Navigator.pushNamed(context, backTo);
      },
    );
  }
}
