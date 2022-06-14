import 'package:flutter/material.dart';

Widget buildButton({
  required String text,
  required IconData icon,
  required VoidCallback onClicked,
}) {
  return ElevatedButton(
    onPressed: onClicked,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(width: 20),
        Text(text),
      ],
    ),
  );
}
