import 'dart:async';

import 'package:learn_bloc/BLoC/bloc.dart';
import 'package:learn_bloc/DataLayer/location.dart';
import 'package:learn_bloc/DataLayer/restaurant.dart';
import 'package:learn_bloc/DataLayer/zomato_client.dart';

class RestaurantBloc implements Bloc {
  final Location location;
  final _client = ZomatoClient();
  final _controller = StreamController<List<Restaurant>>();

  Stream<List<Restaurant>> get stream => _controller.stream;
  RestaurantBloc(this.location);

  void submitQuery(String query) async {
    final results = await _client.fetchRestaurants(location, query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
