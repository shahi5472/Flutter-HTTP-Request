import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrestapihttpdemo/model/Album.dart';

Widget albumWidget(Future<List<Album>> futureAlbum) {
  return Container(
    child: FutureBuilder<List<Album>>(
      future: futureAlbum,
      builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Album album = snapshot.data[index];
                return Text("Title : ${album.title}");
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    ),
  );
}
