import 'package:act_provider/provider/pokemon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme.dart';

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
    print(pokemonList);

    return Scaffold(
        body: CustomScrollView(slivers: [
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
      pokemonList.isEmpty
          ? SliverList(
              delegate: SliverChildListDelegate([
              const Center(
                child: Text('No hay pokemons'),
              )
            ]))
          : SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                // Imagen de internet, numero de pokemon (Text), nombre del pokemón (Text)
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 117, 190, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Color.fromRGBO(255, 204, 0, 1), width: 4),
                      ),
                      child: Column(children: [
                        const FadeInImage(
                            placeholder: AssetImage('assets/loading.gif'),
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1643725173053-ed68676f1878?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80')),
                        const Text('0',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(pokemonList[index]['name'].toUpperCase(),
                            style: const TextStyle(fontSize: 30)),
                      ])),
                );
              }, childCount: 14),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2))
    ]));
  }
}
