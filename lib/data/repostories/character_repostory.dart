import 'package:cloud_firestore_test/data/models/character.dart';
import 'package:cloud_firestore_test/data/web_services/character_web_services.dart';

class CharacterRepository {
  final CharacterWebServices characterWebServices;
  CharacterRepository(this.characterWebServices);
  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters.map((element) => Character.fromJson(element)).toList();
  }
}
