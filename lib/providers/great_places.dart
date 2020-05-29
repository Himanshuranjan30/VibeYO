
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../models/place.dart';
import '../helpers/db_helper.dart';
import '../screens/place_detail_screen.dart';
import 'package:sqflite/sqflite.dart';


class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((place) => place.id == id,orElse: ()=>null);
  }

  Future<void> updateplace(String id,String description,File image,String title) async{

   int selectedIndex=_items.indexWhere((vibe)=>vibe.id==id);
   final selectedVibe= Place(id: id, title: title, description: description, image: image);
   
   _items[selectedIndex]=selectedVibe;
   
   DBHelper.updateData(selectedVibe.description, selectedVibe.id);
   notifyListeners();
   

   
  }
  
  
  Future<void> addPlace(
    String id,
    String pickedTitle,
    File pickedImage,
    String description,
    
  ) async {
    
    
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      description: description,
      
    );
    _items.add(newPlace);
    
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'description': newPlace.description,
      
    });
    notifyListeners();
  }

  Future fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
                id: item['id'],
                title: item['title'],
                image: File(item['image']),
                description: item['description'],
                
                
                
                ),
              )
        
        .toList();
    notifyListeners();
  }

 Future<void> deletePlaces(String id) async{

 
  final exindex= _items.indexWhere((place)=>place.id == id);
  _items.removeAt(exindex);

  

  
  DBHelper.delete(id);
  notifyListeners();

  
  
  
  
  

}

}