import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:instagram_flutter_app/utilites/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  static Future<String> uploadUserProfileImage(
      String url, File imageFile) async {
    String photoId = Uuid().v4();
    File image = await compressImage(photoId, imageFile);
    if (url != null && url.isNotEmpty){
      // updating user profile
      RegExp exp = RegExp(r"userProfile_(.*).jpg");
      photoId = exp.firstMatch(url)[1];
    }
    StorageUploadTask uploadTask = storageReference
        .child("images/users/userProfile_$photoId.jpg")
        .putFile(image);
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  static Future<File> compressImage(String photoId, File image) async {
    final tempDirectory = await getTemporaryDirectory();
    final path = tempDirectory.path;
    File compressedImageFile = await FlutterImageCompress.compressAndGetFile(
        image.absolute.path, "$path/img_$photoId.jpg",
        quality: 70);
    return compressedImageFile;
  }
}
