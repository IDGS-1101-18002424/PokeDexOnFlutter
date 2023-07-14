// ignore_for_file: avoid_print, unused_import

import 'dart:convert';

import 'package:act_provider/provider/util_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PokemonProvider extends ChangeNotifier {
  final String _urlBase = 'https://pokeapi.co/api/v2/';

  PokemonProvider() {
    print('¡Ay prro! si jalo');
    getPokemons();
  }
  List<dynamic> pokemons = [];
  Future getPokemons() async {
    final String url = '${_urlBase}pokemon?limit=14&offset=0';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as Map;
      pokemons=jResponse['results'];
      notifyListeners();
    }
  }
}
