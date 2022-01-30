import 'package:cloud_firestore_test/busniss_logic/character_cubit.dart';
import 'package:cloud_firestore_test/constants/strings.dart';
import 'package:cloud_firestore_test/data/repostories/character_repostory.dart';
import 'package:cloud_firestore_test/data/web_services/character_web_services.dart';
import 'package:cloud_firestore_test/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
this is an easy on routing then you have to make the Route class and give it
generateRoute method that using the switch statement determine where to go

* */
class AppRouter {
  late CharacterRepository characterRepository;
  late CharacterWebServices characterWebServices;

  AppRouter() {
    this.characterWebServices = CharacterWebServices();
    this.characterRepository = CharacterRepository(characterWebServices);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (BuildContext context) {
                return CharacterCubit(characterRepository);
              },
              child: CharactersScreen(),
            );
          },
        );
      //this way by using constants is better for readability
      case characterDetails:
        return MaterialPageRoute(builder: (_) {
          return CharactersScreen();
        });
    }
  }
}
