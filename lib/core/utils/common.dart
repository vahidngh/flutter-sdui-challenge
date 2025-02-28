import 'package:dynamic_form_builder/core/constants/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
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

Map<String, dynamic> convertFilesToMap(List<PlatformFile> files) {
  final Map<String, dynamic> fileMap = {};

  if (kIsWeb) {
    for (final file in files) {
      fileMap[file.name] = {
        'bytes': file.bytes.toString().substring(0,50)+"...", // File bytes (Uint8List)
        'size': file.size.toString(), // File size in bytes (int)
        'extension': file.extension.toString(), // File extension (String)
      };
    }
  } else {
    for (final file in files) {
      fileMap[file.name] = {
        'path': file.path.toString(), // File path (String)
        'size': file.size.toString(), // File size in bytes (int)
        'extension': file.extension.toString(), // File extension (String)
      };
    }
  }

  return fileMap;
}

FileType getFileType(String fileType) {
  switch (fileType) {
    case IMAGES_FILE_TYPE:
      return FileType.image;
    default:
      return FileType.any;
  }
}
