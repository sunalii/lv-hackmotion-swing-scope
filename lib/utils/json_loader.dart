import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/swing_capture.dart';

Future<List<SwingCapture>> loadSwingCaptures() async {
  final List<String> filenames = [
    '1.json',
    '2.json',
    '3.json',
    '4.json',
    '5.json',
  ];

  List<SwingCapture> captures = [];

  for (final name in filenames) {
    final String rawJson = await rootBundle.loadString('assets/swings/$name');
    final Map<String, dynamic> parsedJson = json.decode(rawJson);
    captures.add(
      SwingCapture.fromJson(name.replaceAll('.json', ''), parsedJson),
    );
  }

  return captures;
}
