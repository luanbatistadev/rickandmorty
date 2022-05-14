import 'package:flutter/material.dart';
import 'package:rickandmorty/constansts/routes/routes.dart';
import 'package:rickandmorty/screens/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      home: HomePage(),
    );
  }
}
