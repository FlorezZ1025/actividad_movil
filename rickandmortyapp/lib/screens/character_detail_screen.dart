import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final dynamic character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character['name']),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Detalles del personaje'),
            // Aquí puedes añadir más detalles sobre el personaje
          ],
        ),
      ),
    );
  }
}
