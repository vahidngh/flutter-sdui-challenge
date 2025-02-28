import 'package:dynamic_form_builder/core/constants/constants.dart';
import 'package:dynamic_form_builder/data/model/dynamic_form_data_dto.dart';
import 'package:dynamic_form_builder/presentation/widgets/custom_file_input.dart';
import 'package:dynamic_form_builder/presentation/widgets/custom_select_field.dart';
import 'package:dynamic_form_builder/presentation/widgets/custom_text_area_input.dart';
import 'package:dynamic_form_builder/presentation/widgets/custom_text_input.dart';
import 'package:dynamic_form_builder/providers/form_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final formProvider = Provider.of<FormProvider>(context, listen: false);
      formProvider.getFormData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فرم ساز آنلاین'),
      ),
      body: Consumer<FormProvider>(
        builder: (context, formProvider, child) {
          if (formProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (formProvider.dynamicFormDataDto == null) {
            return const Center(child: Text('اطلاعاتی وجود ندارد'));
          }

          final formData = formProvider.dynamicFormDataDto!;
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: formData.fields!.length,
                    itemBuilder: (context, index) {
                      final field = formData.fields![index];
                      return _buildFormField(field);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                      height: 40,
                      child: FilledButton(onPressed: (){
                        _submitForm();
                      }, child: Text("ثبت اطلاعات"))),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFormField(Fields field) {
    switch (field.type) {
      case TEXT_INPUT_FIELD_TYPE:
        {
          return CustomTextInput(field: field);
        }
      case TEXT_AREA_FIELD_TYPE:
        {
          return CustomTextAreaInput(field: field);
        }
      case SELECT_FIELD_TYPE:
        {
          return CustomSelectField(field: field);
        }
      case FILE_INPUT_FIELD_TYPE:
        {
          return CustomFileInput(field: field);
        }
      default:
        {
          // In case of unknown input
          return const SizedBox();
        }
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('اطلاعات با موفقیت ثبت شدند.')),
      );
      var collectedData = Provider.of<FormProvider>(context, listen: false).formData;
      showMessageDialog(context,collectedData.toString());
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('لطفا فرم را تکمیل نمایید')),
      );
    }
  }

  void showMessageDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const SelectableText('اظلاعات ارسالی'),
          content: Directionality(textDirection: TextDirection.ltr, child: Text(message)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('تایید'),
            ),
          ],
        );
      },
    );
  }
}
