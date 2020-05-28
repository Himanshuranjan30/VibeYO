import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/great_places.dart';
import 'package:provider/provider.dart';
class EditVibe extends StatelessWidget{

  static const routeName = '/editvibe';
  final _descontroller= TextEditingController();
  
  
  Widget build(BuildContext context)
  {
     final id = ModalRoute.of(context).settings.arguments;
    final tobeupdatedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);
     return Scaffold(
            appBar: AppBar(
        title: Text('Edit'),
        backgroundColor: Colors.indigo,
            ),
         body: Column(
           children: <Widget>[
             Center(
                    child: TextField(controller: _descontroller,
               decoration: InputDecoration(labelText: 'Edit Your Vibe'),),
             ),
             SizedBox(width: 10,height: 10,),
             FloatingActionButton(onPressed: (){Provider.of<GreatPlaces>(context,).updateplace(tobeupdatedPlace.id, _descontroller.text,tobeupdatedPlace.image,tobeupdatedPlace.title);
             Navigator.pop(context);
             },child: Icon(Icons.save),),

             
           ],
         ),
       );
     
  }
}