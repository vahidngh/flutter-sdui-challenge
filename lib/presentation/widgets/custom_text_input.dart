import 'package:dynamic_form_builder/core/constants/constants.dart';
import 'package:dynamic_form_builder/core/utils/common.dart';
import 'package:dynamic_form_builder/core/utils/edge_insets_helper.dart';
import 'package:dynamic_form_builder/core/utils/text_style_helper.dart';
import 'package:dynamic_form_builder/data/model/dynamic_form_data_dto.dart';
import 'package:dynamic_form_builder/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextInput extends StatelessWidget {
  final Fields field;

  const CustomTextInput({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsHelper().parse(field.style!.margin!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            field.label ?? "",
            style: parseTextStyle(context: context, props: field.props, style: field.style),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            maxLength: 20,
            keyboardType: getKeyboardType(field.props!.type??"text"),
            inputFormatters: getInputFormatters(field.props!.type ?? "text"),
            style: parseTextStyle(context: context, props: field.props, style: field.style),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
              ),
              hintText: field.props!.placeholder,
              hintStyle: parseTextStyle(context: context, props: field.props, style: field.style),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _validateInput,
            onChanged: (value){
              if(_validateInput(value)==null) {
                Provider.of<FormProvider>(context, listen: false).updateField(field.name??"", value);
              }
            },
          ),
        ],
      ),
    );
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'این فیلد الزامیست';
    }
    if (field.props!.type == INPUT_NUMBER_PROP_TYPE && double.tryParse(value) == null) {
      return 'عدد نامعتبر';
    }
    return null;
  }
}
