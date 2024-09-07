import 'package:flutter/material.dart';

class ButtonAntw extends StatelessWidget {
  const ButtonAntw({
    super.key,
    required this.answer,
    required this.onTap,
  });
  final String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(fixedSize: const Size(300, 40)),
        onPressed: onTap,
        child: Text(
          answer,
          style: const TextStyle(fontSize: 24),
        ));
  }
}
