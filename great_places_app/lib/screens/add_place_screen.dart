import 'package:flutter/material.dart';

// Widgets
import '../widgets/image_input.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(  // Will take all the height it can get
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField( // Avoiding a form for simplicity since its only 1
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    SizedBox(height: 10,),
                    ImageInput(),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon( // Takes just what it needs
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            onPressed: () {},
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
