import 'package:flutter/material.dart';

class PokemonTypes extends StatelessWidget {
  final List<dynamic> types; // Ajustar el nombre del parámetro a 'types'

  const PokemonTypes(
      {required this.types}); // Ajustar el nombre del parámetro a 'types'

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: types
          .map((type) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  color: _getTypeColor(type['type']['name']),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  type['type']['name'].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
          .toList(),
    );
  }

  Color _getTypeColor(String type) {
  switch (type) {
    case 'normal':
      return Colors.brown;
    case 'fire':
      return Colors.red;
    case 'water':
      return Colors.blue;
    case 'grass':
      return Colors.green;
    case 'electric':
      return Colors.amber;
    case 'ice':
      return Colors.cyan;
    case 'fighting':
      return Colors.orange;
    case 'poison':
      return Colors.purple;
    case 'ground':
      return Colors.brown;
    case 'flying':
      return Colors.indigo;
    case 'psychic':
      return Colors.pink;
    case 'bug':
      return Colors.lightGreen;
    case 'rock':
      return Colors.grey;
    case 'ghost':
      return Colors.indigo;
    case 'dragon':
      return Colors.indigo;
    case 'dark':
      return Colors.brown;
    case 'steel':
      return Colors.blueGrey;
    case 'fairy':
      return Colors.pinkAccent;
    default:
      return Colors.grey;
  }
}

}
