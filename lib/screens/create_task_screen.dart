import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {

  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _valueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
      ),
      body: Form (
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                      ),
                      validator: (text){
                        return null;
                      },
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: _descController,
                      decoration: InputDecoration(
                        hintText: 'Description',
                      ),
                      validator: (text){
                        return null;
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Value',
                          prefixIcon: Icon(Icons.attach_money)
                      ),
                      keyboardType: TextInputType.number,
                      validator: (text){
                        return null;
                      },
                      controller: _valueController
                  ),
                ),


                Padding (
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Text('Create Task'),
                      onPressed: (){
                        if(_formKey.currentState.validate()){

                          _saveTaskInFirebase();

                        }
                      },
                    ),
                  ),
                )

              ],
            ),
          )
      ),
    );
  }
  
  
  Future<Null> _saveTaskInFirebase() async {

    String taskId = Firestore.instance.collection('tasks').document().documentID;

    Map<String, dynamic> map = {
      'id': await taskId,
      'name': _nameController.text,
      'description': _descController.text,
      'value': _valueController.text
    };

    Map<String, dynamic> task ={
      'id': await taskId
    };

    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();

    Firestore.instance.collection('user').document(await currentUser.uid).collection('taskList').add(task);

    Firestore.instance.collection('tasks').document(await taskId).setData(map).then(
        (v) => Navigator.pop(context)
    );

  }
}

/*FutureBuilder(
      future: ,
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Container(child: CircularProgressIndicator());
        }
        else{
          return SingleChildScrollView(
            child: ListView.builder(
                itemBuilder: (context, index){

                }
            ),
          );
        }
      },
    );

 */