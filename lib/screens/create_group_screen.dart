import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {

  final _nameController = TextEditingController();
  final _emailsController = TextEditingController();
  List _invitedUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Group'),
      ),
      body:Column(
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


          Container(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 26.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _emailsController,
                    decoration: InputDecoration(
                        labelText: 'Invite Friend'
                    ),
                  ),
                ),

                RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: Text('Add'),
                  textColor: Colors.white,
                  onPressed: _addUser,
                )
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(4.0),
              itemCount: _invitedUsers.length,
              itemBuilder: buildInvitedList,
            ),
          )

        ],
      )
    );
  }


  Widget buildInvitedList (context, index){
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.8, 0.0),
          child: Icon(Icons.delete, color: Colors.white)
        ),
      ),
      direction: DismissDirection.horizontal,
      child: ListTile(
        title: Text(_invitedUsers[index], style: TextStyle(fontSize: 18.0)),
      ),

      onDismissed: (direction){
        setState(() {
          _invitedUsers.removeAt(index);
        });
      },
    );
  }


  void _addUser(){
    _validateInvitedUser(_emailsController.text);
    _emailsController.clear();
  }

  void _validateInvitedUser(String invitedEmail) {
    Firestore.instance.collection('emails').document(invitedEmail).get().then(
        (dataSnapshot) {
          if(dataSnapshot.exists){
            Firestore.instance.collection('user').document(dataSnapshot.data['uid']).get().then(
                (userSnapshot) {
                  print(userSnapshot.data);
                  if(userSnapshot != null && userSnapshot.exists) {
                    print(userSnapshot.data);
                    setState(() {
                      _invitedUsers.add(userSnapshot.data['name']);
                    });
                  }
                }
            );
          }
        }
    );
  }

  Future<Null> _saveGroupInFirebase() async {

    String groupID = Firestore.instance.collection('tasks').document().documentID;

    Map<String, dynamic> map = {
      'id': await groupID,
      'name': _nameController.text,
      'emails' : _invitedUsers
    };

    Map<String, dynamic> group ={
      'id': await groupID
    };

    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();

    Firestore.instance.collection('user').document(await currentUser.uid).collection('groups').add(group);

    Firestore.instance.collection('groups').document(await groupID).setData(map).then(
            (v) => Navigator.pop(context)
    );

  }
}