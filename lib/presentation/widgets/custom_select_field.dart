import 'package:dynamic_form_builder/core/utils/edge_insets_helper.dart';
import 'package:dynamic_form_builder/core/utils/text_style_helper.dart';
import 'package:dynamic_form_builder/data/model/dynamic_form_data_dto.dart';
import 'package:flutter/material.dart';

class CustomSelectField extends StatefulWidget {
  final Fields field;
  const CustomSelectField({super.key, required this.field});

  @override
  State<CustomSelectField> createState() => _CustomSelectFieldState();
}

class _CustomSelectFieldState extends State<CustomSelectField> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsHelper().parse(widget.field.style!.margin!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.field.label ?? "",
            style: parseTextStyle(context: context, props: widget.field.props, style: widget.field.style),
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownButtonFormField<String>(
            value: null,
            items: widget.field.props!.options!.map((Options item) {
              return DropdownMenuItem<String>(
                value: item.value,
                child: Text(item.label ?? "انتخاب کنید"),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
              ),
            ),
            validator: (value) {
              if (value == null) {
                return 'لطفا یک گزینه را انتخاب کنید';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
