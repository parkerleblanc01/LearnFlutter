import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './location_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: BlocProvider.of<LocationBloc>(context).,
      builder: (context, snapshot) {
        return LocationScreen();
      }
    );
  }
}
