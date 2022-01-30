import 'package:cloud_firestore_test/busniss_logic/character_cubit.dart';
import 'package:cloud_firestore_test/constants/my_colors.dart';
import 'package:cloud_firestore_test/data/models/character.dart';
import 'package:cloud_firestore_test/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  // this will represent all the Characters that coming from the cubit
  late List<Character> allCharacters = [];
  late List<Character> searchedCharacter = [];
  bool isSearching = false; //this for the search app bar
  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

/* from here to the second coming one is how to make search bar */
  Widget _buildTextField() {
    return TextField(
      controller: textEditingController,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        hintText: 'hey search about what you need ',
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
      onChanged: (prefixToSearchUsingIt) {
        addSearchedItemsToSearchCharacters(prefixToSearchUsingIt);
      },
    );
  }

  void addSearchedItemsToSearchCharacters(String prefixToSearchUsingIt) {
    searchedCharacter = allCharacters
        .where((element) =>
            element.name.toLowerCase().startsWith(prefixToSearchUsingIt))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBar() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear),
        ),
      ];
    } else {
      return [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            _startSearch();
          },
        ),
      ];
    }
  }

  void _startSearch() {
    setState(() {
      isSearching = true;
    });
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
  }

  void _stopSearch() {
    _clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      textEditingController.clear();
    });
  }

  Widget _buildAppBarTitle() {
    return Text('Characters');
  }

/*this the end of the search app bar */

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedPage();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return CircularProgressIndicator(
      color: Colors.yellow,
    );
  }

  Widget buildLoadedPage() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myWhite,
        child: Column(
          children: [
            buildCharacterTable(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterTable() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 5, childAspectRatio: 2 / 3),
      itemBuilder: (context, index) {
        return CharacterItem(
          character: textEditingController.text.isNotEmpty
              ? searchedCharacter[index]
              : allCharacters[index],
        );
      },
      itemCount: textEditingController.text.isNotEmpty
          ? searchedCharacter.length
          : allCharacters.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            leading: isSearching
                ? BackButton(
                    color: Colors.green,
                  )
                : Placeholder(),
            backgroundColor: MyColors.myYellow,
            title: (isSearching) ? _buildTextField() : _buildAppBarTitle(),
            actions: _buildAppBar()),
        body: buildBlocWidget(),
      ),
    );
  }
}
