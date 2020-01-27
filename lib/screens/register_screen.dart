import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task_manager/screens/login_screen.dart';

class Register_Screen extends StatefulWidget {
  @override
  _Register_ScreenState createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {

  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Screen'
        ),
      ),
      body: Form (
        child: Column(
        children: <Widget>[

          //Email Input
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email)
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text){
                  if(text.isEmpty) return 'Insert your email';
                },
              ),
            ),
          ),

          //Password Input
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.enhanced_encryption)
                ),
                obscureText: true,
                validator: (text){
                  setState(() {
                    _password = text;
                  });
                  if(text.isEmpty) return 'password';
                },
              ),
            ),
          ),

          //Retype Password Input
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Retype Password',
                    prefixIcon: Icon(Icons.enhanced_encryption)
                ),
                obscureText: true,
                validator: (text){
                  if(text.isEmpty) return 'Retype your password';
                  if(_password != text) return 'Passwords doesn\'t match.' ;
                },
              ),
            )
          ),

          //Button Register
          Padding (
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  'Register'
                ),
                onPressed: (){},
              ),
            ),
          ),

          //Button Return (already have a account)
          Padding (
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  'already have a account?'
                ),
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen())
                  );
                },
              ),
            ),
          )

        ],
        ),
      )


    );
  }
}
