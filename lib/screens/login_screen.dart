import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/screens/signup_screen.dart';
import 'package:instagram_flutter_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {

  static final String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.login(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Instagram",
                  style: TextStyle(fontFamily: "Billabong", fontSize: 50)),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Email"),
                        validator: (input) => !input.contains("@")
                            ? "Please enter a valid email"
                            : null,
                        onSaved: (input) => _email = input
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Password"),
                        validator: (input) => input.length < 6
                            ? "Must be at least 6 charachter"
                            : null,
                        onSaved: (input) => _password = input,
                        obscureText: true
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 250,
                      padding: EdgeInsets.all(10),
                      child: FlatButton(
                          onPressed: _submit,
                          color: Colors.blue,
                          child: Text("Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18))),
                    ),
                    Container(
                      width: 250,
                      padding: EdgeInsets.all(10),
                      child: FlatButton(
                          onPressed: ()=> Navigator.pushNamed(context, SignupScreen.id),
                          color: Colors.blue,
                          child: Text("Go to Signup",
                              style:
                              TextStyle(color: Colors.white, fontSize: 18))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
