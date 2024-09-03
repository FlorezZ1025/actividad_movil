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
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(character.image))),
            const SizedBox(height: 16.0),
            Center(
                child: Text(
              character.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Status: ',
                                style: TextStyle(color: Colors.black, fontSize: 20)), 
                  TextSpan(
                    text: character.status,
                    style: TextStyle(
                      fontSize: 20,
                      color: character.status == 'Alive' ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Text('Species: ${character.species}',
                style: const TextStyle(fontSize: 20)),
            Text('Gender: ${character.gender}',
                style: const TextStyle(fontSize: 20)),
            character.type != ''
                ? Text('Type: ${character.type}',
                    style: const TextStyle(fontSize: 20))
                : const SizedBox.shrink(),
            const SizedBox(height: 8.0),
            Text('Origin: ${character.origin.name}',
                style: const TextStyle(fontSize: 20)),
            Text('Location: ${character.location.name}',
                style: const TextStyle(fontSize: 20)),
           /*     
                     const SizedBox(height: 24),
                    // Botón de acción
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                      child: const Text('Volver'),)
                ,*/
          ],
        )),
      )),
    );
  }
}
