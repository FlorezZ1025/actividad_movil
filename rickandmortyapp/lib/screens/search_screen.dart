import 'package:flutter/material.dart';
import '../services/api_service.dart'; 
import '../models/character.dart'; 
import 'character_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ApiService _apiService = ApiService();
  List<Character> _characters = [];
  bool _isLoading = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchCharacters(); 
  }

  Future<void> _fetchCharacters([String query = '']) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final characters = await _apiService.fetchCharacters(query: query);
      setState(() {
        _characters = characters;
        _hasError = false; 
      });
    } catch (e) { 
      setState(() {
        _characters = [];
        _hasError = true;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
              onChanged: (query) {
                _fetchCharacters(query);
              },
            ),
          ),
          _hasError
          ? const Expanded(child: Center(child: Text('Error al cargar los personajes!',
                            style: TextStyle(
                              color: Color.fromARGB(255, 188, 17, 5),
                              fontWeight: FontWeight.bold,
                              fontSize: 24 ),)))
          : _isLoading
              ? const Expanded(child: Center(child: CircularProgressIndicator()))
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
                          fit: BoxFit.cover,
                        ),
                        title: Text(character.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(character.species),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CharacterDetailScreen(character: character),
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
