import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationService {
  final String baseUrl = 'https://libretranslate.com/translate';

  Future<String> translateText(String text, String targetLanguage) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'q': text,
        'target': targetLanguage,
        'source': 'auto',
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['translatedText'];
    } else {
      throw Exception('Failed to translate text');
    }
  }
}
