import 'dart:io';

import 'package:flutter/foundation.dart';
import '../models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  void addPlace(String title, File image) {
    final newPlace = Place(
      DateTime.now().toString(),
      title,
      null,
      image,
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
