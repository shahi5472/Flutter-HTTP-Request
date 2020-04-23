import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrestapihttpdemo/model/Album.dart';

Widget albumWidget(Future<List<Album>> futureAlbum) {
  return Container(
    child: FutureBuilder<List<Album>>(
      future: futureAlbum,
      builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
        if (snapshot.hasData) {
          List<Album> album = snapshot.data;
          return ListView.builder(
            itemCount: album.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(8),
                child: Text(
                    'Id : ${album[index].id}\nTitle : ${album[index].title}'),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }

        // By default, show a loading spinner.
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
  );
}
