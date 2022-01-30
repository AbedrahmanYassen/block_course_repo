class Character {
  late int charId;
  late String name;
  late String birthDay;
  late List<dynamic> jops;
  late String image;
  late String ifDeadOrAlive;
  late String nickName;
  late List<dynamic> appearanceOfSeasons;
  late String actorName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSoulAppearnce;
  Character.fromJson(Map<String, dynamic> jsonObject) {
    this.name = jsonObject['name'];
    this.charId = jsonObject['char_id'];
    this.image = jsonObject['img'];
    this.actorName = jsonObject['portrayed'];
    this.appearanceOfSeasons = jsonObject['appearance'];
    this.birthDay = jsonObject['birthday'];
    this.categoryForTwoSeries = jsonObject['category'];
    this.betterCallSoulAppearnce = jsonObject['better_call_saul_appearance'];
    this.jops = jsonObject['occupation'];
    this.nickName = jsonObject['nickname'];
    this.ifDeadOrAlive = jsonObject['status'];
  }
}
