import 'package:flutter/material.dart';
import '../screen/screen.dart';

class AppRouter {
  static String initialRouter = '/';

  static final routers = {
    '/': (context) => const HomeScreen(),
  };

  static onGenerateRoute(settings) {
    return MaterialPageRoute(
        builder: (context) => const ErrorScreen(
              errorMessage: 'YA SE TUVO UN ERROR, YA DATE DE BAJA',
            ));
  }
}
