import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/services/auth_service.dart';

class SignupScreen extends StatefulWidget {

  static final String id = "Signup_screen";

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.signupUser(context, _name, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
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
                        decoration: InputDecoration(labelText: "Name"),
                        textInputAction: TextInputAction.next,
                        validator: (input) =>
                        input
                            .trim()
                            .isEmpty
                            ? "Please enter a valid name"
                            : null,
                        onSaved: (input) => _name = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Email"),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (input) =>
                        !input.contains("@")
                            ? "Please enter a valid email"
                            : null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Password"),
                        textInputAction: TextInputAction.done,
                        validator: (input) =>
                        input.length < 6
                            ? "Must be at least 6 charachter"
                            : null,
                        obscureText: true,
                        onSaved: (input) => _password = input,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 250,
                      padding: EdgeInsets.all(10),
                      child: FlatButton(
                          onPressed: _submit,
                          color: Colors.blue,
                          child: Text("Sign up",
                              style:
                              TextStyle(color: Colors.white, fontSize: 18))),
                    ),
                    Container(
                      width: 250,
                      padding: EdgeInsets.all(10),
                      child: FlatButton(
                          onPressed: () => Navigator.pop(context),
                          color: Colors.blue,
                          child: Text("Back to login",
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
