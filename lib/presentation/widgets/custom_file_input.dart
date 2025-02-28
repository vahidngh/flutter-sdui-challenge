import 'package:dynamic_form_builder/core/constants/constants.dart';
import 'package:dynamic_form_builder/core/utils/common.dart';
import 'package:dynamic_form_builder/core/utils/edge_insets_helper.dart';
import 'package:dynamic_form_builder/core/utils/text_style_helper.dart';
import 'package:dynamic_form_builder/data/model/dynamic_form_data_dto.dart';
import 'package:dynamic_form_builder/presentation/widgets/custom_thumbnail.dart';
import 'package:dynamic_form_builder/providers/form_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
                    files = await _pickFile(allowMultiple: widget.field.props!.multiple ?? false, fileType: widget.field.props!.accept!);
                    setState(() {});
                    updateProvider(files);
                  },
                  child: Text("انتخاب تصاویر"),
                ),
              ),
              Expanded(
                  child: Wrap(
                    children: List.generate(
                        files.length,
                            (index) =>
                            CustomThumbnail(
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
    result = await _pickFiles(allowMultiple: allowMultiple, fileType: getFileType(fileType));
    return result;
  }


  Future<List<PlatformFile>> _pickFiles({bool allowMultiple = false, FileType fileType = FileType.any}) async {
    try {
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

  void updateProvider(List<PlatformFile> files) {
    if (files.isNotEmpty) {
      var mapOfFiles = convertFilesToMap(files);
      print("mapOfFiles::: "+mapOfFiles.toString());
      Provider.of<FormProvider>(context, listen: false).updateField(widget.field.name ?? "", mapOfFiles);
    }
  }

}


