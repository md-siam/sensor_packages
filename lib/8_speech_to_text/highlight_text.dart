// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';

final Map<String, HighlightedWord> highlights = {
  'bitcoin': HighlightedWord(
    onTap: () => print('bitcoin'),
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
  'cryptocurrency': HighlightedWord(
    onTap: () => print('cryptocurrency'),
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.green,
      fontWeight: FontWeight.bold,
    ),
  ),
  'hype': HighlightedWord(
    onTap: () => print('hype'),
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
  'losing': HighlightedWord(
    onTap: () => print('losing'),
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.blueAccent,
      fontWeight: FontWeight.bold,
    ),
  ),
  'recession': HighlightedWord(
    onTap: () => print('recession'),
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.green,
      fontWeight: FontWeight.bold,
    ),
  ),
};
