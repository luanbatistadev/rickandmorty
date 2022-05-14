import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/screens/details_page/details_page.dart';
import 'package:rickandmorty/screens/home_page/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case '/home':
      return _createRoute(const HomePage());
    case '/details':
      if (args is Character) {
        return _createRoute(
          DetailsPage(
            character: args,
          ),
        );
      }
      return _errorRoute();
    default:
      return _errorRoute();
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 700),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1, 0);
      const end = Offset.zero;
      const curve = Curves.ease;
      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    },
  );
}
