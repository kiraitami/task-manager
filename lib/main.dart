import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/models/task.dart';
import 'package:flutter_app_task_manager/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/user.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  )) ;
}

/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<User>(
      model: User(),
      child: ScopedModelDescendant<User>(
        builder: (context, child, model){
          return ScopedModel<Task>(
            model: Task(model),
          )
        },
      ),
    );
  }
}
*/


