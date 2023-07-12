import 'package:act_provider/provider/pokemon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router/app_router.dart';
import 'screen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
        /*ChangeNotifierProvider(create: (_) => [Solo cambias este provider de los que user]),*/
      ],
      child: MaterialApp(
        title: 'Act. Provider',
        debugShowCheckedModeBanner: false, // Quita la tira de debug
        theme: ThemeData.dark(),
        darkTheme: ThemeData.light(),
        initialRoute: AppRouter.initialRouter,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
        home: const HomeScreen(), // Carga el HomeScreen de primera instancia
      ),
    );
  }
}
