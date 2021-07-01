import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../widgets/location_input.dart';
import '../widgets/image_input.dart';
import '../providers/greate_places.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;
  String _locationCoords;

  void _selectoLocation(String loc) {
    _locationCoords = loc;
  }

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatePlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage,
      _locationCoords,
    );
    Navigator.of(context).pop();
    print('hehehe $_locationCoords');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Title', border: OutlineInputBorder()),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ImageInput(_selectImage),
                    SizedBox(
                      height: 10,
                    ),
                    LocationInput(_selectoLocation),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 15),
              ),
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
