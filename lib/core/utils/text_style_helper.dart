import 'package:dynamic_form_builder/core/constants/constants.dart';
import 'package:dynamic_form_builder/core/utils/hex_color_helper.dart';
import 'package:dynamic_form_builder/data/model/dynamic_form_data_dto.dart';
import 'package:flutter/material.dart';

TextStyle? parseTextStyle({required BuildContext context,String? size, Props? props, Style? style}){
  switch(size){
    case INPUT_TEXT_LARGE : return Theme.of(context).textTheme.labelLarge!.copyWith(color: HexColorHelper.fromHex(props!.color)??Colors.black,);
    case INPUT_TEXT_MEDIUM : return Theme.of(context).textTheme.labelMedium!.copyWith(color: HexColorHelper.fromHex(props!.color)??Colors.black);
    case INPUT_TEXT_SMALL : return Theme.of(context).textTheme.labelSmall!.copyWith(color: HexColorHelper.fromHex(props!.color)??Colors.black);
    default : return Theme.of(context).textTheme.labelMedium!.copyWith(color: HexColorHelper.fromHex(props!.color)??Colors.black);
  }
}