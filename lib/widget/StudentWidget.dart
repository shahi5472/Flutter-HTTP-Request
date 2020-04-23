import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrestapihttpdemo/api/Apiz.dart';
import 'package:flutterrestapihttpdemo/model/StudentModel.dart';

Widget studentWidget() {
  return Container(
    child: FutureBuilder<StudentModel>(
      future: Apiz.getStudent(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasData) {
          final student = snapshot.data;

          return Container(
            padding: EdgeInsets.only(left: 4, right: 4, top: 2),
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Container(
                margin: EdgeInsets.all(6),
                padding: EdgeInsets.all(6),
                child:
                    Text("Name : ${student.name} \n\nSkill : ${student.skill}"),
              ),
            ),
          );
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
