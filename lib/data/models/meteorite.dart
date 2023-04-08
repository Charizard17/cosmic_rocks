class Meteorite {
  final String id;
  final String? name;
  final String? fall;
  final String? year;
  final String? mass;
  final String? recclass;
  final double? latitude;
  final double? longitude;
  final String? type;

  Meteorite({
    required this.id,
    this.name,
    this.fall,
    this.year,
    this.mass,
    this.recclass,
    this.latitude,
    this.longitude,
    this.type,
  });

  factory Meteorite.fromJson(Map<String, dynamic> json) {
    return Meteorite(
      id: json['id'] as String,
      name: json['name'] != null ? json['name'] as String : null,
      fall: json['fall'] != null ? json['fall'] as String : null,
      year: json['year'] != null ? json['year'] as String : null,
      mass: json['mass'] != null ? json['mass'] as String : null,
      recclass: json['recclass'] != null ? json['recclass'] as String : null,
      latitude: json['reclat'] != null
          ? double.tryParse(json['reclat'] as String) ?? 0.0
          : null,
      longitude: json['reclong'] != null
          ? double.tryParse(json['reclong'] as String) ?? 0.0
          : null,
      type: json['type'] != null ? json['type'] as String : null,
    );
  }
}
