import 'package:instagram_flutter_app/models/user_model.dart';
import 'package:instagram_flutter_app/utilites/constants.dart';

class DatabaseService {
  static void updateUser(User user) {
    userReference.document(user.id).updateData({
      "name": user.name,
      "profileImageUrl": user.profileImageUrl,
      "bio": user.bio,
    });
  }
}
