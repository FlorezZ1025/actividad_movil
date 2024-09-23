import 'package:flutter/material.dart';
import 'package:rickandmortyapp/screens/episodes_screen.dart';
import 'search_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/rickWallpaper.jpg'),
          fit: BoxFit.cover,
          )
        ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenido!',
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 14, 14, 14),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: const Text(
                'Que quieres ver?',
                style:TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 14, 14, 14),
                  shadows:[ 
                    Shadow(color: Color.fromARGB(115, 255, 255, 255), blurRadius: 5.0, offset: Offset(1.0,1.0))
                    ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
     SizedBox(
      width: 200,
       child: ElevatedButton(
                  
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shadowColor: Colors.black,
                    elevation: 10,
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Personajes',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
     ),
            const SizedBox(height:15),
     SizedBox(
      width: 200,
       child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EpisodeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Episodios',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
     ),
          ],
        ),
      ),
      ),
    );
  }
}
