import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String _baseUrl = 'https://rickandmortyapi.com/api/character';

  Future<List<dynamic>> fetchCharacters({String query = ''}) async {
    final url = query.isEmpty ? _baseUrl : '$_baseUrl?name=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
