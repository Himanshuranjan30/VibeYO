import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/add_place_screen.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';
import '../widgets/editvibe.dart';


class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';

  
  
  


  

  

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);
     

    
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
        actions: <Widget>[IconButton(icon: Icon(Icons.delete),onPressed: ()
        {Provider.of<GreatPlaces>(context,).deletePlaces(selectedPlace.id);
        
        Navigator.pop(context);}
        
        
      )],),
      body: Column(
          children: <Widget>[
            Expanded(
                          child: Container(
                height: 500,
                width: double.infinity,
                
                child: Image.file(
                  selectedPlace.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  
                ),
              ),
            ),
            
            SizedBox(width:10),
            Container(child: selectedPlace.description==null? Center(child: Text("Nothin"),): Container(
                height: 140,
                child: Card(
                  color: Colors.indigo,
                  shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
            elevation: 10,
                  margin: EdgeInsets.all(18),
                  child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             SingleChildScrollView(
                            child: ListTile(
                leading: Icon(Icons.favorite, size: 20),
                title: Text('${selectedPlace.description}', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontWeight:FontWeight.bold)),
                
            ),
             ),
          ]
                  ),
                ),
            )),
            FloatingActionButton(onPressed:()=> Navigator.of(context).pushNamed('/editvibe',arguments: selectedPlace.id)
            
            
            

            
               //                       <--- TextField
                
                
            ,
             

             child:Icon(Icons.edit),backgroundColor: Colors.indigo),
            
          ],
        ),
      
    );
    
  
  }
}
