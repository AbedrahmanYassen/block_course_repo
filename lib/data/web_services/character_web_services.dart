import 'package:cloud_firestore_test/constants/strings.dart';
import 'package:dio/dio.dart';

class CharacterWebServices {
  late Dio dio;
  CharacterWebServices() {
    BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
