import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/screens/feed_screen.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _fireStore = Firestore.instance;

  static void signupUser(
      BuildContext context, String name, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null) {
        _fireStore
            .collection("/users")
            .document(signedInUser.uid)
            .setData({"name": name, "email": email, "profileImageUrl": ""});
        Navigator.pushReplacementNamed(context, FeedScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }

  static void login(String email, String password) async {
    _auth.signInWithEmailAndPassword(email: email, password: email);
  }

  static void logout() {
    _auth.signOut();
  }
}
