class Geo {
  final String lat;
  final String lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
    );
  }
}
