import 'package:flutter/material.dart';

class EdgeInsetsHelper {
  EdgeInsetsGeometry? parse(String input) {
    List<String> parts = input.replaceAll('px', '').trim().split(' ');
    List<double> values = parts.map((part) => double.parse(part)).toList();

    // Handle different cases based on the number of values
    switch (values.length) {
      case 1: // "10px" -> all sides
        return EdgeInsets.only(
          top: values[0],
          right: values[0],
          bottom: values[0],
          left: values[0],
        );
      case 2: // "10px 0" -> top/bottom, left/right
        return EdgeInsets.only(
          top: values[0],
          right: values[1],
          bottom: values[0],
          left: values[1],
        );
      case 3: // "10px 10px 10px" -> top, left/right, bottom
        return EdgeInsets.only(
          top: values[0],
          right: values[1],
          bottom: values[2],
          left: values[1],
        );
      case 4: // "10px 10px 10px 10px" -> top, right, bottom, left
        return EdgeInsets.only(
          top: values[0],
          right: values[1],
          bottom: values[2],
          left: values[3],
        );
      default:
        throw FormatException('Invalid input format: $input');
    }
  }
}