import 'dart:io';

import 'package:flutter/foundation.dart';



class Place {
  String id;
  final String title;
  String description;
  
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.description,
    
    @required this.image,
  });
}
