import 'dart:convert';
import 'dart:async';

import 'package:flutterrestapihttpdemo/model/Album.dart';
import 'package:flutterrestapihttpdemo/model/Photo.dart';
import 'package:flutterrestapihttpdemo/model/Post.dart';
import 'package:flutterrestapihttpdemo/model/StudentModel.dart';
import 'package:flutterrestapihttpdemo/model/User.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com/";

class Apiz {
  static Future<List<User>> getUsers() async {
    final response = await http.get(baseUrl + "users");
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);

      List<User> users =
          body.map((dynamic item) => User.fromJson(item)).toList();

      return users;
    } else {
      throw Exception();
    }
  }

  //Its Working Fine
  static Future<List<Photo>> getPhoto() async {
    final response = await http.get(baseUrl + "photos");

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);

      List<Photo> photos =
          body.map((dynamic item) => Photo.fromJson(item)).toList();

      return photos;
    } else {
      throw Exception();
    }
  }

  //Its working fine
  static Future<List<Post>> getPosts() async {
    final response = await http.get(baseUrl + "posts");
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw Exception();
    }
  }

  //Its Working final
  static Future<List<Album>> getAlbums() async {
    final response = await http.get(baseUrl + 'albums');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Album> albums = body
          .map(
            (dynamic item) => Album.fromJson(item),
          )
          .toList();

      return albums;
    } else {
      throw Exception('Failed to load album');
    }
  }

  //Its working fine
  static Future<StudentModel> getStudent() async {
    final url = "https://api.jsonbin.io/b/5e1219328d761771cc8b9394";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonStudent = jsonDecode(response.body);
      return StudentModel.fromJson(jsonStudent);
    } else {
      throw Exception();
    }
  }
}
