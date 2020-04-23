import 'package:flutterrestapihttpdemo/model/Geo.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final List<Geo> geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: json['geo'] as List<Geo>,
    );
  }
}
