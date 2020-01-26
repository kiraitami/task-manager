import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class User extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  static User of(BuildContext context) => ScopedModel.of<User>(context);


  }

  /*
  Future<Null> _loadCurrentUser() async {
    if (firebaseUser != null){
      firebaseUser = await _auth.currentUser();
    }

    else {
      if ()
    }
  }
*/

}