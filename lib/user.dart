class User {
  late String name;
  late String age;
  User.fromJson(Map<String, dynamic> jsonObject) {
    name = jsonObject["name"];
    age = jsonObject["age"];
  }
}
