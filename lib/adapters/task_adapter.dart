import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/models/task.dart';
import 'package:flutter_app_task_manager/screens/task_details_screen.dart';

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
                return _taskTile(snapshot, context);
              }
            },
          ),
        ),
      ),
    );
  }


  GestureDetector _taskTile(AsyncSnapshot snapshot, context){
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
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
    ),
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TaskDetails())
        );
      },
      onDoubleTap: () {print("doubletapped");},
      onLongPress: () {print("foi pressssssseeed");},
    );
  }
}
