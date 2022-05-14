import 'package:flutter/material.dart';
import 'package:rickandmorty/constansts/constants.dart';
import 'package:rickandmorty/models/character.dart';

class RMCircleAvatar extends StatelessWidget {
  final Character character;
  const RMCircleAvatar({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Hero(
        tag: character.image!,
        child: CircleAvatar(
          radius: 55,
          backgroundColor: kWhiteColor,
          backgroundImage: NetworkImage(
            character.image!,
          ),
        ),
      ),
    );
  }
}
