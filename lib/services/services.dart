import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rickandmorty/models/character.dart';

class RickAndMortyService {
  static const String baseUrl = 'https://rickandmortyapi.com/api';

  Future<List<Character>?> getCharacters({int page = 1}) async {
    final response = await http.get(Uri.parse('$baseUrl/character'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      final charactersMap = json['results'] as List<dynamic>;
      final characters = charactersMap
          .map(
            (character) =>
                Character.fromJson(character as Map<String, dynamic>),
          )
          .toList();

      return characters;
    } else {
      return null;
    }
  }
}
