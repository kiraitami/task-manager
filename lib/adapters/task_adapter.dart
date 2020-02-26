import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/models/task.dart';

class TaskAdapter extends StatelessWidget {

  final Future<DocumentSnapshot> _task;

  TaskAdapter(this._task);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },

      child: Card(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Text( _geTaskFromFirebase().name ),
        ),
      ),
    );
  }

  Task _geTaskFromFirebase() {
    Task task;
    _task.then(
            (map){
         task = Task.fromDocument(map);
        }
    );
    return task;
  }
}
