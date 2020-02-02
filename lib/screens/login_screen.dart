import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Passowrd',
                    prefixIcon: Icon(Icons.lock)
                ),
                obscureText: true,
                validator: (text){
                  if (text.isEmpty) return 'Insert your password';
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Register_Screen())
                    );
                  },

                  child: Text('Login')
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: FlatButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Register_Screen())
                  );
                },
                child: Text('Register Now'),
              ),
            )
          ],
        ),
      )
    );
  }
}
