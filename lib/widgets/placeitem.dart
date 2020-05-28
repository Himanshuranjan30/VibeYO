import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_guide/models/place.dart';

class PlaceItem extends StatelessWidget {
  final String id;
  

  final File image;

  PlaceItem(
    this.id,
    
    this.image,
  );

  void selectPlace(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/place-detail', arguments: id);
  }

  Widget build(BuildContext context) {
    return Card(
          child: Container(
        height: 90,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: InkWell(
          onTap: () => selectPlace(context),
          splashColor: Theme.of(context).primaryColor,
          child: Container(
            
            
              
              decoration: BoxDecoration(
                  border: Border.all(
                color: Color(0xff000000),
                width: 1,
              )),
              child: Image.file(
                image,
                fit: BoxFit.cover,
                width: 300,
              ),
              alignment: Alignment.center,
            ),
          ),
        
      ),
    );
  }
}
