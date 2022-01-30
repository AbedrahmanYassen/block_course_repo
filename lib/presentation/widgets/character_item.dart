import 'package:cloud_firestore_test/constants/my_colors.dart';
import 'package:cloud_firestore_test/data/models/character.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  CharacterItem({required this.character, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: MyColors.myYellow, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        child: Container(
          color: Colors.green,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: 'assets/images/laoding.gif',
                  image: character.image)
              : Image.network(character.image),
        ),
        footer: Container(
          width: double.infinity,
          color: Colors.black,
          child: Text(
            character.name,
            style: TextStyle(fontSize: 15, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
