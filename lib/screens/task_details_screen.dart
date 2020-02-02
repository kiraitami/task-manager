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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FractionallySizedBox(widthFactor: 1,
              child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text('Nome da Tarefa', style: TextStyle(fontSize: 30), textAlign: TextAlign.center,)
              )
            ),
            FractionallySizedBox(widthFactor: 1,
            child: Padding(
              padding:  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Text ('Isso é onde vai vir a descrição do texto inteiro, com todos os tipos de detalhes que possam existir, etc etc etc', style: TextStyle(fontStyle: FontStyle.italic)),
            ),),
            FractionallySizedBox(widthFactor: 0.8,
              child: Padding(
                padding: EdgeInsets.only(top:2, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('check box text', textAlign: TextAlign.left,),
                    Checkbox(activeColor: Colors.grey, value: true )
                  ],
                ),
              )
            ),
            FractionallySizedBox(widthFactor: 0.8,
                child: Padding(
                  padding: EdgeInsets.only(top:2, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('check box text', textAlign: TextAlign.left,),
                      Checkbox(activeColor: Colors.grey, value: true )
                    ],
                  ),
                )
            ),
            FractionallySizedBox(widthFactor: 0.8,
                child: Padding(
                  padding: EdgeInsets.only(top:2, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('check box text', textAlign: TextAlign.left,),
                      Checkbox(activeColor: Colors.grey, value: true )
                    ],
                  ),
                )
            ),
          ],

        ),
      )
     );
   }
 }
 