import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/screens/menu_screen.dart';
import 'package:flutter_app_task_manager/screens/register_screen.dart';
import 'package:flutter_app_task_manager/screens/task_details_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(20.0),
              child:  TextFormField(
                decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email)
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text){
                  if (text.isEmpty) return 'Insert your email';
                },
                controller: _emailController,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock)
                ),
                obscureText: true,
                validator: (text){
                  if (text.isEmpty) return 'Insert your password';
                },
                controller: _passController,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),

              child: RaisedButton(
                  onPressed: () async {
                    FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passController.text).then(
                            (usersnapshot) async {
                              print("deu certo");
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => MenuScreen())
                              );
                        }
                    ).catchError((error) {
                      print(error);
                      print("deu errado");
                    });
                    },
                  child: SizedBox(
                    child: Text('Login', style: TextStyle(fontSize: 17), textAlign: TextAlign.center,),
                    width: 120,
                    height: 20,
                  )
              ),
            ),

            Padding(
              padding: EdgeInsets.all(5.0),
              child: FlatButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Register_Screen())
                  );
                },
                child: SizedBox(
                  child: Text ('Register Now', textAlign: TextAlign.center,),
                  width: 120,
                  height: 20,
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: OutlineButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TaskDetails())
                    );
                  },
                  child: SizedBox(
                    child: Text ('Test Now', textAlign: TextAlign.center,),
                    width: 120,
                    height: 20,
                  )
              ),
            )
          ],
        ),
      )
    );
  }
}
