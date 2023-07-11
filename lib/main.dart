import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'screen/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la tira de debug
      title: 'My App',
      initialRoute: AppRouter.initialRouter,
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      home: HomeScreen(), // Carga el HomeScreen de primera instancia
    );
  }
}
