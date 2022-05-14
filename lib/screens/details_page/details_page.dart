import 'package:flutter/material.dart';
import 'package:rickandmorty/constansts/constants.dart';
import 'package:rickandmorty/models/character.dart';

class DetailsPage extends StatefulWidget {
  final Character character;
  const DetailsPage({Key? key, required this.character}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: _buildCard(widget.character),
          )
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: kBlackColor,
      centerTitle: true,
      title: Text(
        widget.character.name!,
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 23),
      ),
    );
  }

  Widget _buildCard(Character character) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _buildContainerCard(character),
        _buildCircleAvatar(character),
      ],
    );
  }

  Widget _buildCircleAvatar(Character character) {

    return Padding(
      padding: const EdgeInsets.all(12.0).copyWith(left: 0,),
      child: Hero(
        tag: character.image!,
        child: CircleAvatar(
          radius: 70,
          backgroundColor: kWhiteColor,
          backgroundImage: NetworkImage(
            character.image!,
          ),
        ),
      ),
    );
  }

  Widget _buildText({
    required String text,
    double fontSize = 18,
    Color color = kWhiteColor,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.left,
  }) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  List<Widget> _buildOriginText(Character character) {
    return [
      Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            _buildText(
              text: 'Gender: ',
              fontSize: 23,
              color: Colors.grey,
            ),
            _buildText(
              text: character.gender!,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            _buildText(
              text: 'Origin: ',
              fontSize: 23,
              color: Colors.grey,
            ),
            Flexible(
              child: _buildText(
                text: character.origin!.name!,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            _buildText(
              text: 'Location: ',
              fontSize: 23,
              color: Colors.grey,
            ),
            Flexible(
              child: _buildText(
                text: character.location!.name!,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _buildStatusText(Character character) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: _buildText(
            text: character.status!,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        _buildText(
          text: ' - ${character.species!}',
          fontSize: 20,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _buildNameText(Character character) {
    return _buildText(
      text: character.name!,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildContainerCard(Character character) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        top: 80,
      ),
      child: Hero(
        tag: character.name!,
        child: Material(
          elevation: 25,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: size.width * 0.9,
            height: size.height * 0.7,
            decoration: BoxDecoration(
              color: kGreyColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    children: [
                      _buildNameText(character),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Material(
                          elevation: 15,
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: kWhiteColor,
                            ),
                            height: 35,
                            width: size.width * 0.5,
                            child: _buildStatusText(character),
                          ),
                        ),
                      ),
                      ..._buildOriginText(character),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
