import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/character.dart'; 

class ApiService {
  final String _baseUrl = 'https://rickandmortyapi.com/api/character';

  Future<List<Character>> fetchCharacters({String query = ''}) async {
    final url = query.isEmpty ? _baseUrl : '$_baseUrl?name=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return (data['results'] as List)
          .map((chars) => Character.fromJson(chars))
          .toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
