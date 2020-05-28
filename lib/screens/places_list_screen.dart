import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/placeitem.dart';

import './add_place_screen.dart';
import '../providers/great_places.dart';
import './place_detail_screen.dart';
import './myinfo.dart';

class PlacesListScreen extends StatefulWidget {
  
  
  
  
  
  @override
  _PlacesListScreenState createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  GreatPlaces greatPlaces;
  Future<void> getList;
 
  
  
  
  void didChangeDependencies()
  {
    final greatplaces= Provider.of<GreatPlaces>(context);
    
    if(this.greatPlaces!=greatplaces){
    this.greatPlaces=greatplaces;
    
    getList= greatplaces.fetchAndSetPlaces();}
    super.didChangeDependencies();
  }
  
   
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),

          IconButton(icon: Icon(Icons.info), onPressed: ()=>Navigator.of(context).pushNamed(MyInfo.routeName),)
        ],
      ),
      body: FutureBuilder(
        
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: const Text('Got no places yet, start adding some!'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
                    ? ch
                    : GridView.builder(
                              itemCount:
                                  Provider.of<GreatPlaces>(context).items.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                
                                
                              ),
                        
                        
                        itemBuilder: (ctx, i) {
                              
                                return 
                                                                   Container(
                                        child: PlaceItem(
                                      Provider.of<GreatPlaces>(context).items[i].id,
                                      Provider.of<GreatPlaces>(context)
                                          .items[i]
                                          .image,
                                    ),
                                  
                                  
                              
                              
                              
                              
                              
                            );}
                                ),
                      ),
              future: getList,),
      
      );
    
  }
}
