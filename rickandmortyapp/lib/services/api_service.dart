import 'package:http/http.dart' as http;
import 'package:rickandmortyapp/models/episode.dart';
import 'dart:convert';
import '../models/character.dart';

class ApiService {
  final String _baseUrl = 'https://rickandmortyapi.com/api/';

  Future<List<Character>> fetchCharacters({String query = ''}) async {
    final url = query.isEmpty
        ? '${_baseUrl}character'
        : '${_baseUrl}character?name=$query';
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

  Future<List<Episode>> fetchEpisodes() async {
    final url = '${_baseUrl}episode';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((ep) => Episode.fromJson(ep))
          .toList();
    } else {
      throw Exception('Failed to load episodes');
    }
  }
}
