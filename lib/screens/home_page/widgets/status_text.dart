import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/screens/home_page/widgets/widgets.dart';

class RMStatusText extends StatelessWidget {
  final Character character;

  const RMStatusText({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: character.status == 'Dead'
                ? Colors.red
                : character.status == 'unknown'
                    ? Colors.yellow
                    : Colors.green,
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RMText(
            text: character.status!,
            fontSize: 20,
            color: Colors.white70,
          ),
        ),
        RMText(
          text: ' - ${character.species!}',
          fontSize: 20,
          color: Colors.white70,
        ),
      ],
    );
  }
}
