import 'package:flutter_app_task_manager/models/goal.dart';
import 'package:scoped_model/scoped_model.dart';

class Task extends Model {

  String taskId;
  String name;
  String description;
  List<Goal> goalList;

  Task(this.name, this.description);



}