import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService({String baseUrl}) : _dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options) {
        // You can add headers or log the requests here
        return options;
      },
      onResponse: (response) {
        // Handle response data
        return response;
      },
      onError: (DioError e) {
        // Handle errors
        return e;
      },
    ));
  }

  Future<Response> login(Map<String, dynamic> data) async {
    return await _dio.post('/login', data: data);
  }

  Future<Response> register(Map<String, dynamic> data) async {
    return await _dio.post('/register', data: data);
  }

  Future<Response> getHalls() async {
    return await _dio.get('/halls');
  }

  Future<Response> selectMeal(int mealId) async {
    return await _dio.post('/select-meal', data: {'mealId': mealId});
  }

  Future<Response> cancelMeal(int mealId) async {
    return await _dio.delete('/cancel-meal', data: {'mealId': mealId});
  }

  Future<Response> getHistory() async {
    return await _dio.get('/history');
  }
}