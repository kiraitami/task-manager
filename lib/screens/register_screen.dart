import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email)
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (text){
              if(text.isEmpty) return 'Insert your email';
            },
          ),

          TextFormField(
            decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.email)
            ),
            obscureText: true,
            validator: (text){
              setState(() {
                _password = text;
              });
              if(text.isEmpty) return 'password';
            },
          ),

          TextFormField(
            decoration: InputDecoration(
                hintText: 'Retype Password',
                prefixIcon: Icon(Icons.email)
            ),
            obscureText: true,
            validator: (text){
              if(text.isEmpty) return 'Retype your password';
              if(_password != text) return 'Passwords doesn\'t match.' ;
            },
          ),

          Padding (
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  'Registrar'
                ),
                onPressed: (){},
              ),
            ),
          )
        ],
        ),
      )


    );
  }
}
