import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/models/task.dart';

class TaskAdapter extends StatelessWidget {

  final String _taskID;

  TaskAdapter(this._taskID);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },

      child: Card(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: FutureBuilder<DocumentSnapshot>(
            future: Firestore.instance.collection('tasks').document(_taskID).get(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else {
                return GestureDetector(
                  child: _taskTile(snapshot),
                  onTap: (){},
                );
              }
            },
          ),
        ),
      ),
    );
  }


  Container _taskTile(AsyncSnapshot snapshot){
    return Container(
      padding: EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
            Text(snapshot.data['name'], style: TextStyle(fontWeight: FontWeight.bold)),
            Text(snapshot.data['description']),
            Text(snapshot.data['value'], style: TextStyle(fontWeight: FontWeight.bold)),
          ],
      ),
    );
  }
}
