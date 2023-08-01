import 'dart:convert';

import 'package:act_provider/provider/util_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PokemonProvider extends ChangeNotifier {
  final String _urlBase = 'https://pokeapi.co/api/v2/';
  PokemonProvider() {
    print('PokemonProvider');
    getPokemons();
  }
  List<dynamic> pokemons = [];
  Future getPokemons() async {
    final String url = '${_urlBase}pokemon?limit=16&offset=0';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as Map;
      pokemons = jResponse['results'];
      notifyListeners();
    } else if (response.statusCode == 408) {
      print('no hay datos broooo');
    }
  }

  getPokemonsByName({required String name}) async {
    final String url = '${_urlBase}pokemon/$name';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as Map;
      return jResponse;
    }
  }
}
