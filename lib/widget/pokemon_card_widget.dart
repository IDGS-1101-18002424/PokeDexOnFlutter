import 'package:act_provider/provider/pokemon_provider.dart';
import 'package:act_provider/widget/pokemon_types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonCardWidget extends StatefulWidget {
  final String pokemonName;
  const PokemonCardWidget({super.key, required this.pokemonName});

  @override
  State<PokemonCardWidget> createState() => _PokemonCardWidget();
}

class _PokemonCardWidget extends State<PokemonCardWidget> {
  Map _pokemon = {};

  @override
  void initState() {
    getPokemon();
    super.initState();
  }

  getPokemon() async {
    final pokemon = await Provider.of<PokemonProvider>(context, listen: false)
        .getPokemonsByName(name: widget.pokemonName);
    setState(() => _pokemon = pokemon);
  }

  @override
  Widget build(BuildContext context) {
    return _pokemon.isEmpty
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/loading.gif'),
                    image: NetworkImage(_pokemon['sprites']['front_default'],
                        scale: 1),
                  ),
                  Text(
                    _pokemon['species']['name'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'N.° ${(_pokemon['id'].toString().padLeft(4, '0'))}',
                    style: const TextStyle(color: Colors.black45),
                  ),
                  PokemonTypes(types: _pokemon['types']),
                ],
              ),
            ),
          );
  }
  
}
