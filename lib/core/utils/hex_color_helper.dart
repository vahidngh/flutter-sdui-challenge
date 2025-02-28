import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class HexColorHelper {
  static Color? fromHex(String? hexString) {
    if (hexString==null) return null;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hexString.replaceFirst('#', ''));
    final colorValue = int.tryParse(buffer.toString(), radix: 16);
    if (colorValue == null) {
      throw FormatException('Invalid hex color: $hexString');
    }
    return Color(colorValue);
  }
}