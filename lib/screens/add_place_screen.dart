import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';

import '../providers/great_places.dart';


class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  String id;
  final _titleController = TextEditingController();
  File _pickedImage;
  final _desController = TextEditingController();
  

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null || _desController.text.isEmpty
        ) {
      return;
    }
    id= DateTime.now().toString();
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(id,_titleController.text, _pickedImage, _desController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Vibe'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(decoration: InputDecoration(labelText: 'Description'),
                    controller: _desController,
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add Vibe'),
            onPressed: _savePlace,
            elevation: 10,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
