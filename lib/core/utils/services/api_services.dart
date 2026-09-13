import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  ApiServices({required Dio dio}) : _dio = dio;
  final String baseUrl = 'https://www.googleapis.com/books/v1/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
