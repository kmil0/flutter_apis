import 'package:flutter/material.dart';
import 'package:flutter_api/utils/widgets/card_menu.dart';
import 'package:flutter_api/views/rick_morty/rick_morty.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> shadowList = [
      BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 30,
          offset: const Offset(0, 10))
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WorkShop APIs",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.orangeAccent.shade700,
      ),
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(children: [
          const SizedBox(height: 10),
          CardMenu(
            titleApi: 'Rick and Morty',
            imageName: 'assets/images/rick.png',
            imageSize: 240,
            shadowList: shadowList,
            onFunction: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RickAndMortyView())),
          ),
          const SizedBox(
            height: 10,
          ),
          CardMenu(
              titleApi: 'Pokémon',
              imageName: 'assets/images/pokemon.png',
              imageSize: 200,
              shadowList: shadowList),
          CardMenu(
              titleApi: 'Marvel Heroes',
              imageName: 'assets/images/marvel.png',
              imageSize: 320,
              shadowList: shadowList),
          CardMenu(
              titleApi: 'Covid Tracking',
              imageName: 'assets/images/covid.png',
              imageSize: 210,
              shadowList: shadowList),
          CardMenu(
              titleApi: 'Crypto Nomics',
              imageName: 'assets/images/nomics.png',
              imageSize: 160,
              shadowList: shadowList),
          CardMenu(
              titleApi: 'OpenWeather',
              imageName: 'assets/images/openweather.png',
              imageSize: 250,
              shadowList: shadowList),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
