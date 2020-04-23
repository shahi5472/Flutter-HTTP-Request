import 'package:flutterrestapihttpdemo/model/Photo.dart';
import 'package:flutterrestapihttpdemo/model/Post.dart';
import 'package:flutterrestapihttpdemo/model/User.dart';
import 'package:flutterrestapihttpdemo/widget/AlbumWidget.dart';
import 'package:flutterrestapihttpdemo/widget/PhotoWidget.dart';
import 'package:flutterrestapihttpdemo/widget/PostWidget.dart';
import 'package:flutterrestapihttpdemo/widget/StudentWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutterrestapihttpdemo/widget/UserWidget.dart';

import 'api/Apiz.dart';
import 'model/Album.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Post>> futurePost;
  Future<List<Photo>> futurePhoto;
  Future<List<Album>> futureAlbum;
  Future<List<User>> futureUser;

  @override
  void initState() {
    super.initState();
    futurePost = Apiz.getPosts();
    futurePhoto = Apiz.getPhoto();
    futureAlbum = Apiz.getAlbums();
    futureUser = Apiz.getUsers();
    print(futureUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest Api Demo'),
      ),
      body: userWidget(futureUser),
    );
  }
}
