import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaService {
  static const _baseUrl = 'BASE_URL';

  Future<List<Map<String, dynamic>>> fetchMeteorites() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<Map<String, dynamic>> meteorites =
          List<Map<String, dynamic>>.from(data);
      return meteorites;
    } else {
      throw Exception('Failed to fetch meteorites');
    }
  }
}
