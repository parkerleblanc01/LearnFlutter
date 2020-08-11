import 'dart:async';

// BLoC
import 'package:learn_bloc/BLoC/bloc.dart';

// DataLayer
import 'package:learn_bloc/DataLayer/location.dart';
import 'package:learn_bloc/DataLayer/zomato_client.dart';

class LocationQueryBloc implements Bloc {
  final _controller = StreamController<List<Location>>();
  final _client = ZomatoClient();
  Stream<List<Location>> get locationStream => _controller.stream;

  void submitQuery(String query) async {
    // 1
    final results = await _client.fetchLocations(query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}