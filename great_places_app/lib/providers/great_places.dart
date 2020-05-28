import 'package:flutter/foundation.dart';

// Models
import '../models/place.dart';
import '../models/place_location.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return new List<Place>.from(_items);
  }
}
