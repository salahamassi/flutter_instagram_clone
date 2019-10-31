import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String profileImageUrl;
  final String email;
  final String bio;

  User({this.id, this.name, this.profileImageUrl, this.email, this.bio});

  factory User.fromDocument(DocumentSnapshot document) {
    return User(
        id: document.documentID,
        name: document["name"],
        profileImageUrl: document["profileImageUrl"],
        email: document["email"],
        bio: document["bio"] ?? "");
  }
}
