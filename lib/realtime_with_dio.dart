import 'package:dio/dio.dart';

class RealtimeWithDio {
  late Dio dio;
  RealtimeWithDio() {
    BaseOptions options = new BaseOptions(
        baseUrl: 'https://learning-f763c-default-rtdb.firebaseio.com/',
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000);
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllUsers() async {
    Response response = await dio.get('users');
    return response.data;
  }
}
