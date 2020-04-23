import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrestapihttpdemo/model/User.dart';

Widget userWidget(Future<User> futureUser) {
  return Container(
    child: FutureBuilder<User>(
      future: futureUser,
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasData) {
          return Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                User user = snapshot.data;
                return Text("Name : ${user.name}");
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
