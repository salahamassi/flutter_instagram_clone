import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/screens/home_screen.dart';
import 'package:instagram_flutter_app/screens/auth_screens/login_screen.dart';
import 'package:instagram_flutter_app/screens/auth_screens/signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  Widget _getHomeScreen(){
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){
        if(snapshot.hasData){
          return HomeScreen(userId: snapshot.data.uid);
        }else{
          return LoginScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      home: _getHomeScreen(),
      theme: ThemeData(
        primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
          color: Colors.black
        )
      ),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        HomeScreen.id: (context) => HomeScreen()
      },
    );
  }
}

