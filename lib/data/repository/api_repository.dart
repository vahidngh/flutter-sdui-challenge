import 'dart:convert';
import 'package:dynamic_form_builder/data/model/dynamic_form_data_dto.dart';
import 'package:dynamic_form_builder/webservice/api_service.dart';

class ApiRepository {
  final ApiService _apiService;

  ApiRepository(this._apiService);

  Future<DynamicFormDataDto> fetchFormData() async {
    // use api service to fetch data but here I use the json mock data
    const jsonResponse =
        '''{"fields":[{"label":"برند:","name":"brand","props":{"color":"#000000","placeholder":"برند ماشین را وارد کنید","size":"large","type":"text"},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"input"},{"label":"مدل:","name":"model","props":{"color":"#000000","placeholder":"مدل ماشین را وارد کنید","size":"medium","type":"text"},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"input"},{"label":"سال ساخت:","name":"year","props":{"max":"2024","min":"1900","placeholder":"سال ساخت را وارد کنید","type":"number"},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"input"},{"label":"نوع سوخت:","name":"fuel_type","props":{"options":[{"label":"بنزین","value":"بنزین"},{"label":"گاز","value":"گاز"},{"label":"دیزل","value":"دیزل"},{"label":"الکتریکی","value":"الکتریکی"}]},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"select"},{"label":"رنگ ماشین:","name":"color","props":{"placeholder":"رنگ ماشین را وارد کنید","type":"text"},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"input"},{"label":"تعداد مالکین قبلی:","name":"previous_owners","props":{"min":"0","placeholder":"تعداد مالکین قبلی را وارد کنید","type":"number"},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"input"},{"label":"توضیحات وضعیت فنی:","name":"technical_condition","props":{"cols":50,"placeholder":"توضیحات درباره وضعیت فنی ماشین","rows":4},"style":{"borderRadius":"5px","margin":"10px 0","padding":"10px"},"type":"textarea"},{"label":"تصاویر ماشین:","name":"car_images","props":{"accept":"image/*","maxSize":"5MB","multiple":true},"style":{"margin":"10px 0","padding":"8px"},"type":"file"}]}''';
    await Future.delayed(const Duration(seconds: 3));
    return DynamicFormDataDto.fromJson(json.decode(jsonResponse));

    try {
      var response = await _apiService.post("/my-endpoint");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return DynamicFormDataDto.fromJson(json.decode(response.body));
      } else if (response.statusCode == 400) {
        //return error message
      } else if (response.statusCode == 401) {
        //return unauthorised user
      } else if (response.statusCode >= 500 && response.statusCode <= 599) {
        //return server no response
      }else{
        //return unknown status
      }
    } on Exception catch (e) {
      rethrow;
    }
  }
}
