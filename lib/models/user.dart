import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/screens/menu_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class User extends Model {
  
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  
  String id;
  String name;
  String email;
  List<String> tasklist;
  List<String> grouplist;

  static User of(BuildContext context) => ScopedModel.of<User>(context);
  
  
  void createUserInFirebase(String email, String pass, BuildContext context) async {
    //FirebaseUser user = await
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass).then(
            (user) async {
              firebaseUser = user;
              await _saveUserData();
              notifyListeners();
              print("deu certo");
              FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass).then(
                      (usersnapshot) async {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MenuScreen(usersnapshot.uid))
                    );

                  }
              ).catchError((String error) {
                print(error);
              });
            }
    ).catchError( (error) {
      print(error);
      notifyListeners();
      print('deu errado');
    });
  }

  Future<Null> _saveUserData() async {
    this.id = firebaseUser.uid;

    Map<String, dynamic> map = {
      'id' : this.id,
      'name' : this.name,
      'email' : this.email,
      'tasklist' : this.tasklist,
      'grouplist' : this.grouplist,
    };

    Firestore.instance.collection('user').document(this.id).setData( await map);

  }

  Future<bool> login(String password) async {

  }

}