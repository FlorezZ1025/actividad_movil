import 'package:flutter/material.dart';
import '../services/api_service.dart'; // Importa el servicio de API
import '../models/character.dart'; // Importa el modelo de Character
import 'character_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ApiService _apiService = ApiService();
  List<Character> _characters = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchCharacters(); // Cargar los primeros personajes al iniciar
  }

  Future<void> _fetchCharacters([String query = '']) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final characters = await _apiService.fetchCharacters(query: query);
      setState(() {
        _characters = characters;
      });
    } catch (e) {
      // Maneja el error aquí si es necesario
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Personajes'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Buscar por nombre',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _fetchCharacters(_searchController.text);
                  },
                ),
              ),
              onSubmitted: (query) {
                _fetchCharacters(query);
              },
            ),
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: _characters.length,
                    itemBuilder: (context, index) {
                      final character = _characters[index];
                      return ListTile(
                        leading: Image.network(
                            character.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,),
                        title: Text(character.name),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CharacterDetailScreen(character: character),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
