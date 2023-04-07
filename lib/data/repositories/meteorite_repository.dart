import 'package:cosmic_rocks/data/models/meteorite.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MeteoriteRepository {
  final String _meteoriteApiUrl = 'BASE_URL';

  Future<List<Meteorite>> getMeteorites() async {
    try {
      final response = await http.get(Uri.parse(_meteoriteApiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Meteorite> meteorites =
            data.map((e) => Meteorite.fromJson(e)).toList();
        return meteorites;
      } else {
        throw Exception('Failed to load meteorites');
      }
    } catch (e) {
      throw Exception('Failed to load meteorites');
    }
  }
}
