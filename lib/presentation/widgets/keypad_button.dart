import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  final String label;
  final VoidCallback action;
  const KeypadButton({
    super.key,
    required this.label,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FilledButton(
        onPressed: action,
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
