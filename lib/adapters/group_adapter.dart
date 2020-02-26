import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/models/task.dart';

class GroupAdapter extends StatelessWidget {

  final String _groupID;

  GroupAdapter(this._groupID);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      },

      child: Card(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: FutureBuilder<DocumentSnapshot>(
            future: Firestore.instance.collection('group').document(_groupID).get(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else {
                return _taskTile(snapshot);
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
          Text(snapshot.data['groupname'], style: TextStyle(fontWeight: FontWeight.bold)),
          ],
      ),
    );
  }
}
