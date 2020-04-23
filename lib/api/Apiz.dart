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
  static Future<User> getUsers() async {
    final response = await http.get(baseUrl + "/users");
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  static Future<Photo> getPhoto() async {
    final response = await http.get(baseUrl + "photos");

    if (response.statusCode == 200) {
      return Photo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

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

  static Future<List<Album>> fetchAlbum() async {
    final response = await http.get(baseUrl + 'albums/1');

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
