import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TaskDetails extends StatefulWidget {
   @override
   _TaskDetailsState createState() => _TaskDetailsState();
 }
 
 class _TaskDetailsState extends State<TaskDetails> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Task Details'),
       ),

       body: ListView(
         children: <Widget>[
           Container(color: Colors.amber,),
           Container(color: Colors.black26,),
           Container(color: Colors.blue,),
           Container(color: Colors.lightGreenAccent,)
         ],
       ),
     );
   }
 }
 