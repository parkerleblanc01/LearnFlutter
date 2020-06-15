import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screens
import '../screens/add_place_screen.dart';

// Providers
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (ctx, greatPlaces, ch) =>
            greatPlaces.items.length <= 0 ? ch : ListView.builder(
              itemCount: greatPlaces.items.length,
              itemBuilder: (ctx, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    greatPlaces.items[index].image
                  ),
                ),
                title: Text(greatPlaces.items[index].title),
                onTap: () {
                  // Go to detail page
                },
              ),
            ),
        child: Center(
          child: Text(
            'Got no places yet, start adding some!',
          ),
        ),
      ),
    );
  }
}
