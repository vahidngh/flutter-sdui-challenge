import 'package:dynamic_form_builder/core/constants/constants.dart';
import 'package:flutter/services.dart';

List<TextInputFormatter>? getInputFormatters(String inputType) {
  switch (inputType) {
    case INPUT_TEXT_PROP_TYPE:
      return [];
    case INPUT_NUMBER_PROP_TYPE:
      return [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ];
    default:
      return [];
  }
}

TextInputType? getKeyboardType(String inputType) {
  switch (inputType) {
    case INPUT_TEXT_PROP_TYPE:
      return TextInputType.text;
    case INPUT_NUMBER_PROP_TYPE:
      return const TextInputType.numberWithOptions(
        decimal: true,
        signed: true,
      );
    default:
      return TextInputType.text;
  }
}
