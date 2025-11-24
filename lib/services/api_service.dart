import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/random.php';

  static Future<Map<String, dynamic>> fetchRandomRecipe() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['meals'][0];
    } else {
      throw Exception('Failed to load recipe');
    }
  }
}
