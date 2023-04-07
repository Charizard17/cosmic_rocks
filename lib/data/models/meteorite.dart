class Meteorite {
  final String id;
  final String name;
  final String fall;
  final String year;
  final String mass;
  final String type;
  final String recclass;
  final double latitude;
  final double longitude;

  Meteorite({
    required this.id,
    required this.name,
    required this.fall,
    required this.year,
    required this.mass,
    required this.type,
    required this.recclass,
    required this.latitude,
    required this.longitude,
  });

  factory Meteorite.fromJson(Map<String, dynamic> json) {
    return Meteorite(
      id: json['id'] as String,
      name: json['name'] as String,
      fall: json['fall'] as String,
      year: json['year'] as String,
      mass: json['mass'] as String,
      type: json['type'] as String,
      recclass: json['recclass'] as String,
      latitude: json['reclat'] as double,
      longitude: json['reclong'] as double,
    );
  }
}
