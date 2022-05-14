import 'package:flutter/material.dart';
import 'package:rickandmorty/constansts/constants.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/screens/home_page/widgets/widgets.dart';

class RMContainerCard extends StatelessWidget {
  final Character character;
  const RMContainerCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 50,
        top: 20,
        bottom: 20,
      ),
      child: Hero(
        tag: character.name!,
        child: Material(
          elevation: 25,
          borderRadius: BorderRadius.circular(25),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () =>
                Navigator.pushNamed(context, '/details', arguments: character),
            child: Container(
              width: size.width * 0.82,
              height: 150,
              decoration: BoxDecoration(
                color: kGreyColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RMText(
                      text: character.name!,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    RMStatusText(character: character),
                    ..._buildOriginText(character),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOriginText(Character character) {
    return [
      const RMText(
        text: 'Origin: ',
        color: Colors.grey,
      ),
      RMText(
        text: character.origin!.name!,
      ),
    ];
  }
}
