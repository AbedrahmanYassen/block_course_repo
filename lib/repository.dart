import 'package:cloud_firestore_test/realtime_with_dio.dart';
import 'package:cloud_firestore_test/user.dart';

class UsersRepository {
  final RealtimeWithDio realtimeWithDio;
  UsersRepository(this.realtimeWithDio);
  Future<List<dynamic>> getAllUsers() async {
    final users = await realtimeWithDio.getAllUsers();
    return users.map((e) => User.fromJson(e)).toList();
  }
}
