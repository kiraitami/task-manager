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
  List<String> tasklist;
  List<String> grouplist;

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
      'tasklist' : this.tasklist,
      'grouplist' : this.grouplist,
    };
    Firestore.instance.collection('user').document(this.id).setData( await map);

  }

  Future<User> login(String email, String password) async {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then(
        (user) async {
          Firestore.instance.collection('user').document(user.uid).get().then(
              (snapshot){
                this.email = snapshot.data['email'];
                this.name = snapshot.data['name'];
                this.tasklist = snapshot.data['tasklist'];
                this.grouplist = snapshot.data['grouplist'];
              }
          ).catchError( (error) {

          });

        }
    ).catchError((error) {
      print(error);
      notifyListeners();
    });
  }

}