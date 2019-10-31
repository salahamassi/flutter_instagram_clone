import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/models/user_model.dart';
import 'package:instagram_flutter_app/screens/auth_screens/edit_profile_screen.dart';
import 'package:instagram_flutter_app/utilites/constants.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  ProfileScreen({this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: userReference.document(widget.userId).get(),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if (!snapShot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          User user = User.fromDocument(snapShot.data);

          return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(user.profileImageUrl),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text("12",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                    "posts",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text("386",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                    "Followrs",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text("358",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                    "Following",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            width: 200,
                            child: FlatButton(
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_)=> EditProfileScreen(user: user))),
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text(
                                "Edit Profile",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Container(
                        height: 80,
                        child: Text(user.bio, style: TextStyle(fontSize: 15))),
                    Divider()
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
