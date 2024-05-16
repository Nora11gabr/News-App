import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = 'https://newsapi.org/v2/';
  final Dio dio;
  final apiKey = 'f68abf8b7f314506a3c6885dce646120';
  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response respose = await dio.get('$baseUrl$endPoint&apiKey=$apiKey');

    return respose.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endpoint, required dynamic data}) async {
    var response = await dio.post(
      '$baseUrl$endpoint',
      data: data,
    );
    return response.data;
  }
}
