import 'package:flutter/material.dart';
import 'package:flutter_api/data/models/rick_character.dart';
import 'package:flutter_api/utils/widgets/Rick_Morty/characters_card.dart';
import 'package:flutter_api/views/rick_morty/controller.dart';

class RickAndMortyView extends StatelessWidget {
  const RickAndMortyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rick And Morty API",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.orangeAccent.shade700,
      ),
      backgroundColor: Colors.grey.shade50,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: getCharacters(),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<CharacterDTO>> getCharacters() =>
      FutureBuilder<List<CharacterDTO>>(
          future: rickController.getCharacters(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final List<CharacterDTO> characters = snapshot.data ?? [];
            final bool characterCounter = characters.isNotEmpty;
            if (characterCounter) {
              return _buildMyCharacters(characters);
            } else {
              return Container();
            }
          });

  Widget _buildMyCharacters(List<CharacterDTO> characters) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterCard(character: characters[index]);
        });
  }
}
