import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorScreen({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error screen'),
      ),
      body: Center(
        child: Text(
          errorMessage,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
