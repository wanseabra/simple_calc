import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    required this.buttonColor,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final String label;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
            child: Text(
              label,
              style: const TextStyle(fontSize: 30),
            )),
      ),
    );
  }
}
