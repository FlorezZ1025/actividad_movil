import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // Importa la pantalla de bienvenida

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty App', // Establece el título de la app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(), // Establece la pantalla inicial
    );
  }
}
