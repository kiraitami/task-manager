import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FractionallySizedBox(widthFactor: 90,
            child: Text("Nome Tarefa haha"),)

          ],

        ),
      )
     );
   }
 }
 