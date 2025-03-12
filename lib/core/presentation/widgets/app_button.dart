import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.buttonWidget, required this.onTap});

  // final String label;
  final Widget buttonWidget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: buttonWidget);
  }
}
