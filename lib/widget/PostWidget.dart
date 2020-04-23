import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrestapihttpdemo/model/Post.dart';

Widget postWidget(Future<List<Post>> futurePost) {
  return Container(
    child: FutureBuilder(
      future: futurePost,
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasData) {
          List<Post> posts = snapshot.data;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(8),
                child: Text("Id : ${posts[index].id}"
                    "\nTitle : ${posts[index].title}"
                    "\nBody : ${posts[index].body}\n"),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ),
  );
}
