import 'package:flutter/material.dart';
import 'package:rickandmorty/constansts/constants.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/screens/home_page/widgets/card.dart';
import 'package:rickandmorty/screens/home_page/widgets/home_appbar.dart';
import 'package:rickandmorty/services/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Character>? listCharacters = [];

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    final characters = await RickAndMortyService().getCharacters();
    setState(() {
      listCharacters = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: CustomScrollView(
        slivers: [
          const RMHomeAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return RMCard(character: listCharacters![index]);
              },
              childCount: listCharacters?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
