import 'package:flutter/material.dart';

class PlaceDetileScreen extends StatelessWidget {
  static String routName = 'place-detile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Image.network(""),
          ),
        ],
      ),
    );
  }
}
