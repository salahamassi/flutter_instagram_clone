
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _firestore = Firestore.instance;

final userReference = _firestore.collection("users");

final storageReference = FirebaseStorage.instance.ref();