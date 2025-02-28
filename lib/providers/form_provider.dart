import 'package:dynamic_form_builder/data/model/dynamic_form_data_dto.dart';
import 'package:dynamic_form_builder/data/repository/api_repository.dart';
import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  final ApiRepository _apiRepository;
  FormProvider(this._apiRepository);

  DynamicFormDataDto? _dynamicFormDataDto;
  bool _isLoading = false;

  DynamicFormDataDto? get dynamicFormDataDto => _dynamicFormDataDto;
  bool get isLoading => _isLoading;

  Future<void> getFormData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _dynamicFormDataDto = await _apiRepository.fetchFormData();
    } catch (e) {
      _dynamicFormDataDto = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}