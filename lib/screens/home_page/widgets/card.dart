import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/screens/home_page/widgets/widgets.dart';

class RMCard extends StatefulWidget {
  final Character character;
  const RMCard({Key? key, required this.character}) : super(key: key);

  @override
  State<RMCard> createState() => _RMCardState();
}

class _RMCardState extends State<RMCard> {
  @override
  Widget build(BuildContext context) {
    return _buildCard(widget.character);
  }

  Widget _buildCard(Character character) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            RMContainerCard(character: character),
            RMCircleAvatar(character: character),
          ],
        ),
      ],
    );
  }
}
