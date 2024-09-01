import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Center(
              child: Image.network(character.image)),
            const SizedBox(height: 16.0),
            
            Center( child: Text('Name: ${character.name}',style: const TextStyle(
                      fontSize: 20),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,)),
            Text('Status: ${character.status}',
                style: const TextStyle(fontSize: 16)),
            Text('Species: ${character.species}',
                style: const TextStyle(fontSize: 16)),
            Text('Gender: ${character.gender}',
                style: const TextStyle(fontSize: 16)),
            
            character.type != ''
                ? Text('Type: ${character.type}',
                    style: const TextStyle(fontSize: 16))
                : const SizedBox.shrink(),
            const SizedBox(height: 16.0),
            Text('Origin: ${character.origin.name}',
                style: const TextStyle(fontSize: 16)),
            Text('Location: ${character.location.name}',
                style: const TextStyle(fontSize: 16)),
          ],
        )),
        )
      ),
    );
  }
}
