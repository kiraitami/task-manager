import 'package:flutter/material.dart';

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
          children: <Widget>[

            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email)
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if (text.isEmpty) return 'Insert your email';
              },
            ),

            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Passowrd',
                  prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
              validator: (text){
                if (text.isEmpty) return 'Insert your password';
              },
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {

                  },

                  child: Text('Login'),
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}
