import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class User extends Model {
  
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  
  String id;
  String name;
  String email;

  static User of(BuildContext context) => ScopedModel.of<User>(context);
  
  
  void createUserInFirebase(String email, String pass) async {
    //FirebaseUser user = await
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass).then(
            (user) async {
              firebaseUser = user;
              await _saveUserData();
              notifyListeners();
            }
    ).catchError( (error) {
      print('aaaaaaaaaaaaaaaaaaaaaaaaaa');
      print(error);
      notifyListeners();
    });
  }

  Future<Null> _saveUserData() async {
    this.id = firebaseUser.uid;

    Map<String, dynamic> map = {
      'id' : this.id,
      'name' : this.name,
      'email' : this.email,
    };
    Firestore.instance.collection('user').document(this.id).setData( await map);

  }

}