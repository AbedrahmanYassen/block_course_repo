part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharactersLoaded extends CharacterState {
  //once it Loaded so it have list of characters
  final List<Character> characters;
  CharactersLoaded(this.characters);
}
