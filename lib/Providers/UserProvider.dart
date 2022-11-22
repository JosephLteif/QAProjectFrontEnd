import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/User.dart';

class UserProvider extends ChangeNotifier {
  late User _user;

  User get user => _user;

  setUser(User value) {
    _user = value;
    notifyListeners();
  }
}
