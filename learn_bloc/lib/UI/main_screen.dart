import 'package:flutter/material.dart';
import 'package:learn_bloc/BLoC/bloc_provider.dart';
import 'package:learn_bloc/BLoC/location_bloc.dart';
import 'package:learn_bloc/UI/restaurant_screen.dart';

import './location_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: BlocProvider.of<LocationBloc>(context).locationStream,
      builder: (context, snapshot) {
        final location = snapshot.data;

        if (location == null) {
          return LocationScreen();
        }

        return RestaurantScreen(location: location);
      }
    );
  }
}
