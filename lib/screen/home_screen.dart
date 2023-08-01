import 'package:act_provider/provider/pokemon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme.dart';
import '../widget/pokemon_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<PokemonProvider>(context, listen: false).getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pkProvider = Provider.of<PokemonProvider>(context);
    List pokemonList = pkProvider.pokemons;
    /*print(pokemonList);*/

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme_Data.primary,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                child: const Text('PokeDex'),
              ),
              background: const FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  fit: BoxFit.cover,
                  image: AssetImage('assets/pokemon.png')),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PokemonCardWidget(
                  pokemonName: pokemonList[index]['name'],
                );
              },
              childCount: pokemonList.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          )
        ],
      ),
    );
  }
}
