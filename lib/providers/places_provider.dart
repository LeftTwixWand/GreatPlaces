import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places/helpers/db_helper.dart';
import '../models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  void addPlace(String title, File image) {
    final newPlace = Place(DateTime.now().toString(), title, null, image);

    _items.add(newPlace);
    notifyListeners();

    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('places');
    _items = dataList
        .map((item) => Place(
              item['id'],
              item['title'],
              null,
              File(item['image']),
            ))
        .toList();

    notifyListeners();
  }
}
