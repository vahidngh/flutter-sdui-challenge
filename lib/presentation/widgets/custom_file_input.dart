import 'package:dynamic_form_builder/core/constants/constants.dart';
import 'package:dynamic_form_builder/core/utils/edge_insets_helper.dart';
import 'package:dynamic_form_builder/core/utils/text_style_helper.dart';
import 'package:dynamic_form_builder/data/model/dynamic_form_data_dto.dart';
import 'package:dynamic_form_builder/presentation/widgets/custom_thumbnail.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class CustomFileInput extends StatefulWidget {
  final Fields field;

  const CustomFileInput({required this.field, super.key});

  @override
  State<CustomFileInput> createState() => _CustomFileInputState();
}

class _CustomFileInputState extends State<CustomFileInput> {
  List<PlatformFile> files = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsHelper().parse(widget.field.style!.margin!),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.field.label! + ((widget.field.props!.maxSize != null) ? " نهایتا ${widget.field.props!.maxSize!}" : ""),
          style: parseTextStyle(context: context, props: widget.field.props, style: widget.field.style),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsetsHelper().parse(widget.field.style!.padding!),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4.0)),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: () async {
                    files = await _pickFile(allowMultiple:widget.field.props!.multiple ?? false,fileType:widget.field.props!.accept!);
                    print("toString: " + files.length.toString());

                    setState(() {});
                  },
                  child: Text("انتخاب تصاویر"),
                ),
              ),
              Expanded(
                  child: Wrap(
                    children: List.generate(
                        files.length,
                      (index) => CustomThumbnail(
                          onPress: () {
                            setState(() {
                              files.removeAt(index);
                            });

                          },
                          bytes: files[index].bytes,
                          name: files[index].name,
                      )
                    ),
                  )),
            ],
          ),
        )
      ]),
    );
  }

  Future<List<PlatformFile>> _pickFile({required bool allowMultiple, required String fileType}) async {
    List<PlatformFile> result = [];
    result = await _pickFiles(allowMultiple: allowMultiple,fileType: _getFileType(fileType));
    return result;


    // List<File> files = [];
    // File file;
    // if (result != null) {
    //   if(multiple){
    //   file = File(result.files.single.path!);}else{
    //     files = result.paths.map((path) => File(path!)).toList();
    //   }
    //
    // } else {
    //   // User canceled the picker
    // }
    // final ImagePicker picker = ImagePicker();
    // List<XFile> images = [];
    //
    // if (multiple) {
    //   images = await picker.pickMultiImage();
    //   for (var item in images) {
    //     print(item.name);
    //   }
    // } else {
    //   images[0] = (await picker.pickImage(source: ImageSource.gallery))!;
    //   print(images[0].name);
    // }
    // return images;
  }

  FileType _getFileType(String fileType){
    switch(fileType){
      case IMAGES_FILE_TYPE : return FileType.image;
      default: return FileType.any;
    }
  }
}

Future<List<PlatformFile>> _pickFiles({bool allowMultiple = false, FileType fileType = FileType.any}) async {
  try {
    // Pick files
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: allowMultiple,
      type: fileType,
    );

    if (result != null) {
      return result.files;
    }
    return [];
  } catch (e) {
    print("Error picking files: $e");
    return [];
  }
}

// Handle file data for web/mobile
void _handleFiles(List<PlatformFile> files) {
  for (PlatformFile file in files) {
    if (kIsWeb) {
      // Web: Use bytes directly
      final bytes = file.bytes;
      final fileName = file.name;
      print("Web file: $fileName (${bytes?.length} bytes)");
    } else {
      // Mobile: Use File from path
      final path = file.path;
      final fileName = file.name;
      print("Mobile file: $fileName (path: $path)");
    }
  }
}
