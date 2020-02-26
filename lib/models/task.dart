import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_task_manager/models/goal.dart';
import 'package:scoped_model/scoped_model.dart';

class Task extends Model {

  String taskId;
  String name;
  String description;
  List<Goal> goalList;


  Task({this.name, this.description});

  Task.fromDocument(DocumentSnapshot snapshot){
    taskId = snapshot.documentID;
    name = snapshot.data['name'];
    description = snapshot.data['description'];
  }


  Task getTaskFromMap(Map map){
    this.taskId = map['id'];
    this.name = map['name'];
    this.description = map['description'];
  }
}