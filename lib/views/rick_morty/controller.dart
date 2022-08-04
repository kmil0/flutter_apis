import 'dart:convert';

import 'package:flutter_api/data/models/rick_character.dart';
import 'package:flutter_api/data/repository/rick_api.dart';
import 'package:http/http.dart';

class RickController {
  final rickApiRepository = RickAPIRepository();

  Future<List<CharacterDTO>> getCharacters() async {
    final Response response = await rickApiRepository.getCharacters();
    List<CharacterDTO> characters = [];

    final bool validateStatusCode = response.statusCode == 200;
    if (validateStatusCode) {
      final Map dataFromAPI = jsonDecode(response.body);
      final List<dynamic> charactersResults = dataFromAPI["results"];

      characters = charactersResults
          .map((character) => CharacterDTO.fromJson(character))
          .toList();
    }
    return characters;
  }
}

final rickController = RickController();
