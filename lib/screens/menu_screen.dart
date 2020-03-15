import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/adapters/task_adapter.dart';
import 'package:flutter_app_task_manager/models/task.dart';
import 'package:flutter_app_task_manager/screens/create_group_screen.dart';
import 'package:flutter_app_task_manager/screens/create_task_screen.dart';
import 'package:flutter_app_task_manager/screens/task_details_screen.dart';
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
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Main Menu'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'Task'),
                Tab(text: 'Group'),
              ]
            ),
          ),


          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance.collection('user').document(_userId).collection('taskList').getDocuments(),
                  builder: (context, snapshot) {
                    _desiredTab = TAB_NAME.TASK;
                    if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                  }
                    else {
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index){
                            return TaskAdapter(snapshot.data.documents[index] ['id']);
                          },

                      );
                    }
                  }
                  )
              ),

              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FutureBuilder<QuerySnapshot>(
                      future: Firestore.instance.collection('user').document(_userId).collection('groups').getDocuments(),
                      builder: (context, snapshot) {
                        _desiredTab = TAB_NAME.GROUP;
                        if(!snapshot.hasData){
                          return Center(child: CircularProgressIndicator());
                        }
                        else {
                          return ListView.builder(
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index){
                                return GestureDetector(
                                  child: GroupAdapter( snapshot.data.documents[index]['id'] ),
                                  onTap: () => Scaffold
                                      .of(context)
                                      .showSnackBar(SnackBar(content: Text( index.toString()))),
                                );
                              }
                          );
                        }
                      }
                  )
              )
            ]
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
      MaterialPageRoute(builder: (context)=> tab == TAB_NAME.TASK ?  CreateTask() : CreateGroup())
    );
  }


}