import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/services/auth_service.dart';

class FeedScreen extends StatefulWidget {

  static final String id = "feed_screen";

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {

    _logout(){
      AuthService.logout();
     }

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: FlatButton(
          onPressed: _logout(),
          child: Text("Logout"),
        ),
      ),
    );
  }

}