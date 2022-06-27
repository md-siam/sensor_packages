// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';

final Map<String, HighlightedWord> highlights = {
  'flutter': HighlightedWord(
    onTap: () => print('flutter'),
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'voice': HighlightedWord(
    onTap: () => print('voice'),
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.green,
      fontWeight: FontWeight.bold,
    ),
  ),
  'subscribe': HighlightedWord(
    onTap: () => print('subscribe'),
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
  'like': HighlightedWord(
    onTap: () => print('like'),
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.blueAccent,
      fontWeight: FontWeight.bold,
    ),
  ),
  'comment': HighlightedWord(
    onTap: () => print('comment'),
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.green,
      fontWeight: FontWeight.bold,
    ),
  ),
};
