import 'package:flutterrestapihttpdemo/model/Address.dart';
import 'package:flutterrestapihttpdemo/model/Company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
//  final List<Address> address;
//  final List<Company> company;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String,
    );
  }
}
