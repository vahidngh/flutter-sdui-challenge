import 'package:dynamic_form_builder/data/model/dynamic_form_data_dto.dart';
import 'package:dynamic_form_builder/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
        title: const Text('Dynamic Form Builder'),
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
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: formData.fields!.length,
            itemBuilder: (context, index) {
              final field = formData.fields![index];
              return _buildFormField(field);
            },
          );
        },
      ),
    );
  }

  Widget _buildFormField(Fields field) {
    return Text(field.name.toString());
  }
}
