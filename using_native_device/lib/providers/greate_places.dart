import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:using_native_device/helpers/db_helper.dart';
import '../models/places.dart';

class GreatePlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image, String loc) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: image,
      title: title,
      location: loc,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert("user_places", {
      'id': newPlace.id,
      "title": newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndPlaces() async {
    final dbList = await DBHelper.getData("user_places");
    _items = dbList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            location: null,
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
