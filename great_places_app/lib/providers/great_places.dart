import 'dart:io';

import 'package:flutter/foundation.dart';

// Models
import '../models/place.dart';
import '../models/place_location.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return new List<Place>.from(_items);
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: image,
      title: title,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
