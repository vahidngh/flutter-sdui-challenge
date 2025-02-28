import 'dart:io';
import 'package:dynamic_form_builder/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ApiService {

  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();


  final http.Client _client = http.Client();

  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };


  Future<http.Response> get(
      String endpoint, {
        Map<String, String>? queryParameters,
      }) async {
    try {
      final uri = Uri.parse(BASE_URL + endpoint).replace(
        queryParameters: queryParameters,
      );

      final response = await _client.get(uri, headers: _headers);
      return _handleResponse(response);
    } on SocketException {
      throw ApiException('No Internet Connection');
    }
  }


  Future<http.Response> post(
      String endpoint, {
        Object? body,
      }) async {
    try {
      final uri = Uri.parse(BASE_URL + endpoint);
      final response = await _client.post(
        uri,
        headers: _headers,
        body: body,
      );
      return _handleResponse(response);
    } on SocketException {
      throw ApiException('No Internet Connection');
    }
  }


  http.Response _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      if (kDebugMode) {
        print('API Error: ${response.statusCode} - ${response.body}');
      }
      throw ApiException(
        'Request failed with status: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    }
  }


  void cancelRequests() {
    _client.close();
  }
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => 'ApiException: $message';
}