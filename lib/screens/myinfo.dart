import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:link/link.dart';

class MyInfo extends StatelessWidget
{
  static const routeName='/my-info';
  Widget build(BuildContext context)
  {

  
  return Center(
      
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(58.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[ 
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Do Contribute to this project and Follow me on:"),
                )
                ,Center(child:  Container(
                          
                            child: Link(
                child: new Tab(icon: new Image.asset("assets/9919.png"),),
                url: 'https://github.com/Himanshuranjan30/VibeYO',
                
            ),
                          
              ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Link(
                  
                  child: new Tab(icon: new Image.asset("assets/unnamed.png"),),
                  url: 'https://www.linkedin.com/in/himanshu-ranjan-0b5679160/',
                ),
              ),
              
              
              
                
                  
                  
                  
                ]),
          ),),
      );
                                        
}
}