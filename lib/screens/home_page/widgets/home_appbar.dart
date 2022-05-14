import 'package:flutter/material.dart';
import 'package:rickandmorty/constansts/constants.dart';

class RMHomeAppBar extends StatelessWidget {
  const RMHomeAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text(
        'The Rick and Morty Guide',
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23),
      ),
      centerTitle: true,
      floating: true,
      backgroundColor: kBlackColor,
    );
  }
}
