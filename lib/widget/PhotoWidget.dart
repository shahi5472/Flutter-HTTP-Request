import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrestapihttpdemo/api/Apiz.dart';
import 'package:flutterrestapihttpdemo/model/Photo.dart';

Widget photoWidget() {
  return Container(
    child: FutureBuilder<Photo>(
      future: Apiz.getPhoto(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
        } else if (snapshot.hasError) {
          return Container(
            child: Center(child: Text(snapshot.error.toString())),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
  );
}
