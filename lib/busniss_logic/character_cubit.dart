import 'package:bloc/bloc.dart';
import 'package:cloud_firestore_test/data/models/character.dart';
import 'package:cloud_firestore_test/data/repostories/character_repostory.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;
  List<Character> characters = [];
  CharacterCubit(this.characterRepository) : super(CharacterInitial());
  List<Character> getAllCharacters() {
    characterRepository.getAllCharacters().then((listOfCharacters) {
      emit(CharactersLoaded(
          listOfCharacters)); //tells hey take your state here is it
      this.characters = characters;
    });
    return characters;
  }
}
