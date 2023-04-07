import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cosmic_rocks/data/models/meteorite.dart';

class NasaRepository {
  static const String _baseUrl =
      'https://data.nasa.gov/resource/y77d-th95.json';

  Future<List<Meteorite>> getMeteorites() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      final List<Meteorite> meteorites =
          jsonList.map((json) => Meteorite.fromJson(json)).toList();
      return meteorites;
    } else {
      throw Exception('Failed to load meteorites');
    }
  }
}
