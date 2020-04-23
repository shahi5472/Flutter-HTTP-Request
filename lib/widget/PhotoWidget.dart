import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrestapihttpdemo/model/Photo.dart';

Widget photoWidget(Future<List<Photo>> futurePhoto) {
  return Container(
    child: FutureBuilder<List<Photo>>(
      future: futurePhoto,
      builder: (BuildContext context, AsyncSnapshot<List<Photo>> snapshot) {
        if (snapshot.hasData) {
          List<Photo> photo = snapshot.data;
          return ListView.builder(
            itemCount: photo.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Image.network(
                          photo[index].thumbnailUrl,
                          height: 70,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Card(
                          shadowColor: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.only(left: 4, top: 4, bottom: 2),
                                child: Text("Id : ${photo[index].id}"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 4, top: 4, bottom: 2),
                                child: Text("Title : ${photo[index].title}"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
