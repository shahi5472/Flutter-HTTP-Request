import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrestapihttpdemo/model/User.dart';

Widget userWidget(Future<List<User>> futureUser) {
  return Container(
    child: FutureBuilder<List<User>>(
      future: futureUser,
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        print(snapshot.data);
        if (snapshot.hasData) {
          List<User> user = snapshot.data;
          return ListView.builder(
            itemCount: user.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(4),
                  child: Text(
                      "Name : ${user[index].name}\n\nEmail : ${user[index].email}"),
                ),
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
