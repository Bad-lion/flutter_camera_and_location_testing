import 'dart:io';

import 'package:flutter/material.dart';

class PlaceDetileScreen extends StatelessWidget {
  static String routName = 'place-detile';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    String title = routeArgs['title'];
    File image = routeArgs['image'];
    String location = routeArgs['location'];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              child: Image.file(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
          )),
          Text("$title"),
          Container(
            child: Image.network("$location"),
          ),
        ],
      ),
    );
  }
}
