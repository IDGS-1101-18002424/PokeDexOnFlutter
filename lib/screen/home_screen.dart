import 'dart:ui';
import 'package:act_provider/provider/pokemon_provider.dart';
import 'package:flutter/material.dart'
    show
        Alignment,
        AssetImage,
        BorderRadius,
        BoxDecoration,
        BoxFit,
        BuildContext,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        CustomScrollView,
        EdgeInsets,
        FadeInImage,
        FlexibleSpaceBar,
        MainAxisAlignment,
        NetworkImage,
        Padding,
        Radius,
        Row,
        Scaffold,
        SliverAppBar,
        SliverChildBuilderDelegate,
        SliverChildListDelegate,
        SliverGrid,
        SliverGridDelegateWithFixedCrossAxisCount,
        SliverList,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:flutter/src/widgets/framework.dart';
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
    List pokemonsList=pkProvider.pokemons;
    print(pokemonsList);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.primary,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                child: const Text('PokeDex', style: TextStyle(fontSize: 40)),
              ),
              background: const FadeInImage(
                  placeholder: AssetImage('assets/carga.gif'),
                  fit: BoxFit.cover,
                  image: NetworkImage('assets/pokemon.png')),
            ),
          ),
          /*pokemonsList.isEmpty? SliverList(delegate: delegate)
          :*/
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                /*Imagen de internet
                
                , numero de pokemon(Text),Nombre del Pokemon(Text) */
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 126, 192, 247),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInImage(
                          placeholder: AssetImage('assets/carga.gif'),
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1637164011965-635d3e762a38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),
                          fit: BoxFit.cover,
                        ),
                        Text('#006', style: TextStyle(fontSize: 18)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Charizard', style: TextStyle(fontSize: 30))
                          ],
                        ),
                        /*Text('Descripcion', style: TextStyle(fontSize: 20)),*/
                      ],
                    ),
                  ),
                );
              }, childCount: 14),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2)),
        ],
      ),
    );
  }
}
