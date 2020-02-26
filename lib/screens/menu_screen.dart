import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/adapters/task_adapter.dart';
import 'package:flutter_app_task_manager/models/task.dart';
import 'package:flutter_app_task_manager/screens/create_task_screen.dart';
import 'package:flutter_app_task_manager/adapters/group_adapter.dart';


enum TAB_NAME {
  TASK,
  GROUP
}


class MenuScreen extends StatefulWidget {
  
  final _userId;
  MenuScreen(this._userId);
  
  @override
  _MenuScreenState createState() => _MenuScreenState(_userId);
}

class _MenuScreenState extends State<MenuScreen> {

  var _desiredTab = TAB_NAME.TASK;
  final _userId;
  
  _MenuScreenState(this._userId);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Main Menu'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),


          body: TabBarView(
            children: choices.map((Choice choice){
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance.collection('user').document(_userId).collection('taskList').getDocuments(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator());
                    }
                    else {
                      print(snapshot.data.documents);
                      print(snapshot.data.documents.length);

                      return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index){
                          return TaskAdapter( snapshot.data.documents[index]['id'] );
                        }
                      );
                    }
                  },
                )
              );
            }).toList(),
          ),


          floatingActionButton: FloatingActionButton(
            onPressed: (){
              _loadScreen(_desiredTab);
            },
          ),
        ),
      ),
    );
  }




  _loadScreen(TAB_NAME tab){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=> tab == TAB_NAME.TASK ?  CreateTask() : null)
    );
  }


}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '            Tasks             '),
  const Choice(title: '            Groups            '),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard( { Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}