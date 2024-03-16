import 'package:flutter/foundation.dart';
import 'package:todoapp/model/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;

  void updateUser(UserModel user) {
    currentUser = user;
    notifyListeners();
  }
}
